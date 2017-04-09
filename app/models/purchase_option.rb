class PurchaseOption < ApplicationRecord
  has_many :purchases
  validates :price_cents, presence: true
  validates :price_currency, presence: true, inclusion: { in: %w(EUR) }
  validates :video_quality, presence: true, inclusion: { in: %w(HD SD) }
end
