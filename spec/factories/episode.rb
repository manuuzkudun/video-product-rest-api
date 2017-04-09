require 'faker'

FactoryGirl.define do
  factory :episode do
    title { Faker::Book.title }
    plot { Faker::Lorem.sentence }
    episode_in_season { Faker::Number.between(0, 10)}
    season { FactoryGirl.build(:season) }
  end
end
