require 'faker'

FactoryGirl.define do
  factory :movie do
    title { Faker::Book.title }
    plot { Faker::Lorem.sentence }
  end
end
