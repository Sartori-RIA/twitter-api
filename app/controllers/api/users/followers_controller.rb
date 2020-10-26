# frozen_string_literal: true

module Api
  module Users
    class FollowersController < ApplicationController
      load_resource class: Follow

      def index
        paginate json: @followers, include: :user
      end

      def count
        render json: {total: @followers.length}
      end
    end
  end
end
