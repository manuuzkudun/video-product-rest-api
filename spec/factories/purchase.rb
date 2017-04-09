require 'faker'

EXPIRATION_TIME = 2.days

FactoryGirl.define do
  factory :purchase do
    user { FactoryGirl.build(:user) }
    video_product { FactoryGirl.build(:video_product) }
    purchase_option { FactoryGirl.build(:purchase_option) }
    expiration { DateTime.now + EXPIRATION_TIME }
  end
end
