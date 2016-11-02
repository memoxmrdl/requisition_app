require 'rails_helper'

feature 'User sign in' do
  before do
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end

  scenario 'with facebook successfully' do
    visit root_path

    click_link 'Solicitar con Facebook'

    expect(page).to have_content 'Has sido autorizado satisfactoriamente en la cuenta facebook.'
  end

  scenario 'with facebook and should complete my profile' do
    visit root_path

    click_link 'Solicitar con Facebook'

    expect(page).to have_content 'Es necesario completar su perfil para poder crear solicitudes'
  end
end
