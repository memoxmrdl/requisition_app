require 'rails_helper'

feature 'Profiles' do
  before do
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end

  scenario 'complete my profile' do
    sign_in_with_facebook

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

    expect(page).to have_content 'Perfil fue actualizado correctamente'
  end

  scenario 'save profile should see an error' do
    sign_in_with_facebook

    click_button 'Guardar'

    expect(page).to have_content 'Por favor revise los siguientes problemas:'
  end
end
