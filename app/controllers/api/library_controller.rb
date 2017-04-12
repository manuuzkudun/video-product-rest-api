module Api
  class LibraryController < ApplicationController
    def index
      user = User.find(params[:user_id])
      @user_video_products = user.active_video_products
      render json: @user_video_products, status: :ok
    end
  end
end
