FactoryGirl.define do
  factory :personal_reference do
    first_name { Faker::Name.name }
    second_name { Faker::Name.name }
    first_last_name { Faker::Name.name }
    second_last_name { Faker::Name.name }
    cell_phone_number { Faker::PhoneNumber.cell_phone }
  end
end
