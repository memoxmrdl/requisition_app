FactoryGirl.define do
  factory :requisition do
    income 10000.00
    address_years 2
    marital_status 'single'
    requested_amout 200000.00
    payment_terms 'counted'
    bank { Faker::Company.name }
    comment { Faker::Lorem.paragraph }
    company_name { Faker::Company.name }
    company_phone_number { Faker::PhoneNumber.phone_number }
    dependents_number 2
    company_position { Faker::Company.buzzword }
    user

    factory :requisition_with_personal_references do
      transient do
        personal_references_count Requisition::PERSONAL_REFERENCES_COUNT
      end

      before(:create) do |requisition, evaluator|
        build_list(:personal_reference, evaluator.personal_references_count, requisition: requisition)
      end
    end
  end
end
