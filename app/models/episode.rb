class Episode < ApplicationRecord
  belongs_to :season
  validates_presence_of :title, :plot, :episode_in_season
end
