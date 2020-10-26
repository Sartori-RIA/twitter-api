# frozen_string_literal: true

module Api
  module Users
    class FollowsController < ApplicationController
      load_and_authorize_resource
      skip_authorize_resource only: %i[index count check]

      def index
        render json: @follows, include: :follow
      end

      def check
        follow = Follow.find_by(user_id: params[:user_id], follow_id: params[:follow_id])
        if follow.nil?
          render json: {}, status: :no_content
        else
          render json: follow, status: :ok
        end
      end

      def count
        render json: {total: Follow.where(user_id: params[:user_id]).count}
      end

      def create
        @follow = Follow.new(follow_params)

        if @follow.save
          render json: @follow, include: :follow, status: :created
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
