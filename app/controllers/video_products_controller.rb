class VideoProductsController < ApplicationController
  def index
    @video_products = VideoProduct.order(:created_at)
    render json: @video_products, status: :ok
  end
end
