module Api
  module V1
    class LecturesController < ApplicationController

      def index

        # パラメータ判定
        if params[:keyword].blank?
          response_bad_request
        else

        #unless params[:keyword].blank?
        #  keyword = params[:keyword].to_s
        #end

        unless params[:teacher_name].blank?
          teacher_name = params[:teacher_name].to_s
        end

        # データ検索
        output = Subject.search(keyword, teacher_name)

        # jsonを返す
        render json: output

      end


    end
  end
end