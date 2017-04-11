require 'faker'

FactoryGirl.define do
  factory :episode do
    title { Faker::Book.title }
    plot { Faker::Lorem.sentence }
    episode_in_season { Faker::Number.between(0, 10)}
    season { FactoryGirl.create(:season)}
  end
end

FactoryGirl.define do
  factory :season do
    title { Faker::Book.title }
    plot { Faker::Lorem.sentence }
    after(:create) do |season|
      create_list(:episode, 3, season: season)
    end
  end
end


