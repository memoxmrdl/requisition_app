require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  login_user_with_profile
  let(:profile) { @user.profile }

  describe "#edit" do
    before do
      get :edit, id: profile
    end

    it 'should be success' do
      expect(response).to be_success
    end

    it 'should be render template edit' do
      expect(response).to render_template(:edit)
    end
  end

  describe "#update" do
    before do
      put :update, id: profile, profile: { first_name: 'Juan' }
    end

    it 'should be redirect' do
      expect(response).to redirect_to(edit_profile_path(profile))
    end

    it 'should be updated' do
      expect(assigns[:profile].first_name).to eql 'Juan'
    end
  end
end
