# frozen_string_literal: true

module Api
  module Users
    class FollowersController < ApplicationController
      load_resource class: Follow

      def index
        paginate json: @followers, include: :user
      end

      def count
        render json: {total: Follow.where(follow_id: params[:user_id]).count}
      end
    end
  end
end
