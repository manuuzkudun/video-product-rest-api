class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :video_product
  belongs_to :purchase_option
  before_create :set_expiration_date
  validates :expiration, presence: true
  EXPIRATION_TIME = 2.days

  def set_expiration_date
    self.expiration =  DateTime.now + EXPIRATION_TIME
  end

  def active?
    self.expiration > DateTime.now
  end

  def expired?
    self.expiration < DateTime.now
  end

end
