class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = CreateAuthenticateWithFacebookService.new(env["omniauth.auth"]).auth

    sign_in_and_redirect @user, event: :authentication
    set_flash_message(:notice, :success, kind: 'facebook') if is_navigational_format?
  end
end
