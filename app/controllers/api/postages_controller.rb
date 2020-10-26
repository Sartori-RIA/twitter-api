module Api
  class PostagesController < ApplicationController
    load_resource

    def index
      paginate json: @postages.order(created_at: :desc), include: :user
    end
  end
end
