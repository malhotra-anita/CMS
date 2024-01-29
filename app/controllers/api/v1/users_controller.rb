module Api
  module V1   
    class UsersController < ApplicationController
      include DeviseTokenAuth::Concerns::SetUserByToken
      before_action :authenticate_api_v1_user!
      before_action :authorize_user, except: [:index]
      before_action :set_user, only: [:update, :destroy]

      def index
        @users = User.all
        render json: @users
      end

      def create
        @user = User.new(user_params)
        if @user.save
          render json: @user, status: :created
        else
          render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @user.update(user_params)
          render json: @user
        else
          render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @user.destroy
        head :no_content
      end

      private

      def set_user
        @user = @user || User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :role_id)
      end

      def authorize_user
        authorize User
      end
    end
  end
end
