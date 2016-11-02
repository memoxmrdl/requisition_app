require 'rails_helper'

feature 'Requisitions' do
  before do
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end

  scenario 'should create new a requisition with profile completed' do
    sign_in_with_facebook_and_complete_profile

    fill_requisition

    expect(page).to have_content 'Solicitud fue creado correctamente.'
  end

  scenario 'should not create a requisition without profile completed' do
    sign_in_with_facebook

    fill_requisition

    expect(page).to have_content 'Es necesario completar su perfil para poder crear solicitudes'
  end
end
