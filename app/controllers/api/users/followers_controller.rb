module Api
  module Users
    class FollowersController < ApplicationController
      load_resource

      def index
        render json: @followers.order(name: :asc)
      end
    end
  end
end
