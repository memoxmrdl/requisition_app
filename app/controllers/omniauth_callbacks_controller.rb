class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = CreateAuthenticateWithFacebookService.new(env["omniauth.auth"], current_user).auth

    sign_in_and_redirect @user, event: :authentication
  end

  def after_sign_in_path_for(resource)
    if resource.profile&.present?
      super resource
    else
      root_path(resource)
    end
  end
end
