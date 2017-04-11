class Season < VideoProduct
  has_many :episodes, -> { order 'episodes.episode_in_season' }
end
