class Episode < ApplicationRecord
  belongs_to :season, class_name: "VideoProduct"
  validates_presence_of :title, :plot, :episode_in_season, :season
end
