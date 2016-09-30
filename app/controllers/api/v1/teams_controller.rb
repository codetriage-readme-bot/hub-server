module Api
  module V1
    class TeamsController < ApplicationController
      def index
        @team = Team.all
        render json: @team
      end

      def show
        @team = Team.friendly.find(params[:id])
        render json: @team
      end

      def create
        @team = Team.new(team_params)

        if @team.save
          @team.users << User.find(user_params)

          render json: @team
        else
          render json: @team, :status => 422
        end
      end

      private

      def user_params
        params.require(:data).require(:relationships).require(:users).permit(data: [:id]).require(:data).map(&:values)
      end

      def team_params
        params.require(:data).require(:attributes).permit(:name, :description)
      end
    end
  end
end
