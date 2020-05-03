module Api
  module V1
    class LecturesController < ApplicationController

      def index
        #teachers = Teacher.all
        #render json: { status: 'SUCCESS', message: 'Load Lectures', data: teachers }

        unless params[:keyword].blank?
          keyword = params[:keyword].to_s
        end

        unless params[:teacher_name].blank?
          teacher_name = params[:teacher_name].to_s
        end

        #teacher = Teacher.where("name LIKE ?","%#{teacher_name}%")

        output= Subject.joins(:teacher, :lectures)

        #output = Subject.joins(:teacher).where(teachers: {name: "テスト太郎"})
        #.select("
        # subjects.id,
        # subjects.title,
        # subjects.weekday,
        # subjects.period,
        # teachers.id,
        # teachers.name
        #")

        p output


        #render json: { status: 'SUCCESS', message: 'Load Lectures', data: teacher }
        render json: output



      end

    end
  end
end