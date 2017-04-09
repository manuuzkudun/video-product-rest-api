require 'faker'

FactoryGirl.define do
  factory :season do
    title { Faker::Book.title }
    plot { Faker::Lorem.sentence }
  end
end
