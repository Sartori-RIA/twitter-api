# frozen_string_literal: true

module Api
  class UsersController < ApplicationController
    load_and_authorize_resource

    def index
      paginate json: @users.order(name: :asc)
    end

    def show
      render json: @user
    end

    def search
      @users = User.search params[:q]
      render json: @users.order(name: :asc)
    end

    def update
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @user.destroy
    end

    private

    def user_params
      params.permit(:email,
                    :password,
                    :name,
                    :user_name)
    end
  end
end
