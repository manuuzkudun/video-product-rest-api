class MoviesController < ApplicationController

# GET /movies
  def index
    @movies = Movie.order(:created_at)
    json_response(@movies)
  end

end
