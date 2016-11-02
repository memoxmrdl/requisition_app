module Features
  module ToolsHelpers
    def sign_in_with_facebook
      visit root_path
      click_link 'Solicitar con Facebook'
    end

    def complete_profile
      within '.edit_profile' do
        fill_in 'profile[first_name]', with: Faker::Company.name
        fill_in 'profile[second_name]', with: Faker::Company.name
        fill_in 'profile[first_last_name]', with: Faker::Company.name
        fill_in 'profile[second_last_name]', with: Faker::Company.name
        fill_in 'profile[birth_date]', with: '1990-06-24'
        fill_in 'profile[curp]', with: Faker::Code.ean
        fill_in 'profile[rfc]', with: Faker::Code.ean
        select('Masculino', from: 'profile[gender]')
        select('Colima', from: 'profile[birth_state]')
        fill_in 'profile[phone_number]', with: Faker::PhoneNumber.phone_number
      end

      click_button 'Guardar'
    end

    def sign_in_with_facebook_and_complete_profile
      sign_in_with_facebook
      complete_profile
    end

    def fill_requisition
      visit new_requisition_path

      within '.new_requisition' do
        fill_in 'requisition[company_name]', with: Faker::Company.name
        fill_in 'requisition[company_phone_number]', with: Faker::PhoneNumber.phone_number
        fill_in 'requisition[company_position]', with: 'Ingeniero en Software'
        fill_in 'requisition[requested_amout]', with: 10000.0
        fill_in 'requisition[income]', with: 20000.0
        fill_in 'requisition[dependents_number]', with: 3
        fill_in 'requisition[address_years]', with: 2
        select('Contado', from: 'requisition[payment_terms]')
        fill_in 'requisition[bank]', with: Faker::Company.name
        select('Soltero/a', from: 'requisition[marital_status]')

        3.times do |t|
          fill_in "requisition[personal_references_attributes][#{t}][first_name]", with: Faker::Company.name
          fill_in "requisition[personal_references_attributes][#{t}][second_name]", with: Faker::Company.name
          fill_in "requisition[personal_references_attributes][#{t}][first_last_name]", with: Faker::Company.name
          fill_in "requisition[personal_references_attributes][#{t}][second_last_name]", with: Faker::Company.name
          fill_in "requisition[personal_references_attributes][#{t}][cell_phone_number]", with: Faker::PhoneNumber.phone_number
        end

        check('Cuenta con IMSS?')
        check('Cuenta con coche?')
      end

      click_button 'Guardar'
    end
  end
end
