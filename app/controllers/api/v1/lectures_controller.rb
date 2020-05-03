module Api
  module V1
    class LecturesController < ApplicationController

      def index
        teachers = Teacher.all
        render json: { status: 'SUCCESS', message: 'Load Lectures', data: teachers }
      end

    end
  end
end
