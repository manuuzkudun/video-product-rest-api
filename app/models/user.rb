class User < ApplicationRecord
  has_many :purchases
  has_many :video_products, through: :purchases
  validates_presence_of :email

  def active_video_products
    self.purchases
      .select { |p| p.active? }
      .sort_by { |p| p.expiration }
      .map { |p| {
        type: p.video_product.type,
        title: p.video_product.title,
        plot: p.video_product.plot,
        purchase_option: p.purchase_option.video_quality,
        expiration: p.expiration
        }
      }
  end

end
