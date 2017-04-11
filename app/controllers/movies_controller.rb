class MoviesController < ApplicationController

# GET /movies
  def index
    @movies = Movie.order(:created_at)
    render json: @movies, status: :ok
  end

end
