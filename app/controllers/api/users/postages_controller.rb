module Api
  module Users
    class PostagesController < ApplicationController
      load_and_authorize_resource

      def index
        render json: @postages.order(created_at: :desc)
      end

      def show
        render json: @postage
      end

      def create
        @postage = Postage.new(postage_params)

        if @postage.save
          render json: @postage, status: :created
        else
          render json: @postage.errors, status: :unprocessable_entity
        end
      end

      def update
        if @postage.update(postage_params)
          render json: @postage
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