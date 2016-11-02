require "application_responder"

class ApplicationController < ActionController::Base
  include Pundit

  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if resource.profile&.valid?
      super resource
    else
      path = edit_profile_path(resource.profile)
      flash[:alert] = t('messages.missing_profile_html', path: path)
      path
    end
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = t('messages.not_authorized_error')
    redirect_to(request.referrer || root_path)
  end
end
