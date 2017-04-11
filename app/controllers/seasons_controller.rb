class SeasonsController < ApplicationController

  # GET /seasons
  def index
    @seasons = Season.includes(:episodes).order(:created_at)
    render json: @seasons, include: :episodes, status: :ok
  end
end
