module Api
  module V1
    class LecturesController < ApplicationController

      def index

        # パラメータが未設定の場合
        response_bad_request and return if params[:keyword].blank?
        response_bad_request and return if params[:teacher_name].blank?

        keyword = params[:keyword].to_s
        teacher_name = params[:teacher_name].to_s

        # 対象データが無い場合
        @teacher = Teacher.where("name LIKE ?", "%#{teacher_name}%")
        response_not_found(:teacher_name) and return if @teacher.blank?

        @subject = Subject.where("title LIKE ?", "%#{keyword}%")
        response_not_found(:keyword) and return if @subject.blank?

        # データ検索
        @data = Subject.search(keyword, teacher_name)

        # jsonを返す
        render json: @data

      end


    end
  end
end