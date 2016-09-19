module Api
  module V1
    class UsersController < ApplicationController
      def index
        @users = User.all
        render json: @users
      end

      def show
        @user = User.friendly.find(params[:id])
        render json: @user
      end

      def create
      end

      def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
          render json: @user
        else
          render json: @user, status: 422
        end
      end

      private

      def user_params
        params.require(:data).require(:attributes).permit(:name, :email)
      end
    end
  end
end
