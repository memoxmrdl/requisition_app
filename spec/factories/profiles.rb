FactoryGirl.define do
  factory :profile do
    first_name { Faker::Name.name }
    first_last_name { Faker::Name.name }
    birth_date { 26.years.ago }
    curp { Faker::Code.ean }
    birth_state { Faker::Team.state }
    gender 1
    user
  end
end
