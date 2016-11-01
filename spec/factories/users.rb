FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Devise.friendly_token.first(8) }

    trait :with_profile do
      after(:create) do |user|
        user.profile = create(:profile)
      end
    end
  end
end
