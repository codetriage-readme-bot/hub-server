module Api
  module V1
    class UsersController < ApplicationController
      def index
        @users = User.friendly.all
        render json: @users
      end

      def show
        @user = User.find(params[:id])
        render json: @user
      end

      def create
      end
    end
  end
end