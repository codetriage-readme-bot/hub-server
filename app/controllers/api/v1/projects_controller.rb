module Api
  module V1
    class ProjectsController < ApplicationController
      def index
        @project = Project.all
        render json: @project
      end

      def show
        @project = Project.friendly.find(params[:id])
        render json: @project
      end

      def create
        @project = Project.new(project_params)

        if @project.save
          @project.users << User.find(user_params)

          render json: @project
        else
          render json: @project, :status => 422
        end
      end

      def update
        @project = Project.find(params[:id])
        if @project.update_attributes(project_params)
          @project.users << User.find(user_params)

          render json: @project
        else
          render json: @project, status: 422
        end
      end

      private

      def user_params
        params.require(:data).require(:relationships).require(:users).permit(data: [:id]).require(:data).map(&:values)
      end

      def project_params
        params.require(:data).require(:attributes).permit(:title, :description, :status)
      end
    end
  end
end
