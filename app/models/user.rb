class User < ApplicationRecord
  has_many :purchases
  has_many :video_products, through: :purchases

  def active_movies
    self.purchases.select { |p| p.active? }
      .map { |p| p.video_product }
      .select { |vp| vp.movie? }
  end

  def active_seasons
    self.purchases.select { |p| p.active? }
      .map { |p| p.video_product }
      .select { |vp| vp.season? }
  end
end
