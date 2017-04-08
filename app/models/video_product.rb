class VideoProduct < ApplicationRecord
  has_many :purchases
  MOVIE_CLASS_NAME = 'Movie'
  SEASON_CLASS_NAME = 'Season'

  def movie?
    self.class.name == MOVIE_CLASS_NAME
  end

  def season?
    self.class.name == SEASON_CLASS_NAME
  end
end
