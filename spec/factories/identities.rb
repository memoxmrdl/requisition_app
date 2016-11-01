FactoryGirl.define do
  factory :identity do
    provider "facebook"
    uid { Faker::Bitcoin.address }
    user
  end
end
