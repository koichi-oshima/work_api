module Api
  module V1
    class LecturesController < ApplicationController
      before_action :check_params, only: :index
      before_action :set_params, only: :index

      def index
        # データ検索
        @data = Subject.search(@keyword, @teacher_name)
        render json: { subjects: @data }
      end

      private

      def check_params
        # パラメータが未設定の場合
        response_bad_request and return if params[:keyword].blank? || params[:teacher_name].blank?

        # データの有無を確認
        response_not_found and return if Subject.check(params[:keyword]) || Teacher.check(params[:teacher_name])
      end

      def set_params
        @keyword = params[:keyword]
        @teacher_name = params[:teacher_name]
      end

    end
  end
end