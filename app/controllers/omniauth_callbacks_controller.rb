class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = CreateAuthenticateWithFacebookService.new(env["omniauth.auth"]).auth

    sign_in_and_redirect @user, event: :authentication
  end

  def after_sign_in_path_for(resource)
    if resource.profile&.valid?
      super resource
    else
      edit_profile_path(resource.profile)
    end
  end
end
