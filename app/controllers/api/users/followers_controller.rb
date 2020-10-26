# frozen_string_literal: true

module Api
  module Users
    class FollowersController < ApplicationController
      load_resource class: Follow

      def index
        paginate json: @followers, include: :user
      end
    end
  end
end
