# frozen_string_literal: true

module Api
  module Users
    class PostagesController < ApplicationController
      load_and_authorize_resource
      skip_authorize_resource only: %i[index show]

      def index
        paginate json: @postages.order(created_at: :desc), include: :user
      end

      def count
        render json: {total: @postages.length}
      end

      def show
        render json: @postage, include: :user
      end

      def create
        @postage = Postage.new(postage_params)

        if @postage.save
          render json: @postage, include: :user, status: :created
        else
          render json: @postage.errors, status: :unprocessable_entity
        end
      end

      def update
        if @postage.update(postage_params)
          render json: @postage, include: :user
        else
          render json: @postage.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @postage.destroy
      end

      private

      def postage_params
        params.permit(:content, :picture, :user_id)
      end
    end
  end
end
