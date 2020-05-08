module Api
  module V1
    class LecturesController < ApplicationController

      def index

        # パラメータが未設定の場合
        response_bad_request and return if params[:keyword].blank?
        response_bad_request and return if params[:teacher_name].blank?

        keyword = params[:keyword].to_s
        teacher_name = params[:teacher_name].to_s

        # データの有無を確認
        response_not_found(:keyword) and return if Subject.check(keyword)
        response_not_found(:teacher_name) and return Teacher.check(teacher_name)

        # データ検索
        @data = Subject.search(keyword, teacher_name)

        render json: { subjects: @data }
      end


    end
  end
end