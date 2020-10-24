module Api
  module Users
    class FollowsController < ApplicationController
      def index
        render json: @follows.order(name: :asc)
      end

      def show
        render json: @follow
      end

      def create
        @follow = Follow.new(follow_params)

        if @follow.save
          render json: @follow, status: :created
        else
          render json: @follow.errors, status: :unprocessable_entity
        end
      end

      def update
        if @follow.update(follow_params)
          render json: @follow
        else
          render json: @follow.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @follow.destroy
      end

      private

      def follow_params
        params.permit(:user_id, :follow_id)
      end
    end
  end
end
