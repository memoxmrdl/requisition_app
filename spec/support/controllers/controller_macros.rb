module Controllers
  module ControllerMacros
    def login_user_with_profile
      before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @user = FactoryGirl.create(:user, :with_profile)
        sign_in @user
      end
    end
  end
end
