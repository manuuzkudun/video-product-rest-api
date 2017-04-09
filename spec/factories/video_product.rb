require 'faker'

FactoryGirl.define do
  factory :video_product do
    title { Faker::Book.title }
    plot { Faker::Lorem.sentence }
    type { ['Movie', 'Season'].sample }
  end
end
