require 'faker'

FactoryGirl.define do
  factory :purchase_option do
    price_cents { Faker::Commerce.price }
    price_currency { 'EUR' }
    video_quality { ['HD', 'SD'].sample }
  end
end
