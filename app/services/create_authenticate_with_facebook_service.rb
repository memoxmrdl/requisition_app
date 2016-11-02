class CreateAuthenticateWithFacebookService
  attr_accessor :auth_params, :identity, :user, :profile

  def initialize(auth_params, signed_in_resource = nil)
    @auth_params = auth_params
    @identity = Identity.find_or_create_by(uid: @auth_params.uid, provider: @auth_params.provider)
    @user = signed_in_resource ? signed_in_resource : @identity.user
    @profile = @user.try(:profile)
  end

  def auth
    create_user unless user
    add_identity_to_user
    create_profile

    user
  end

  private

  def create_user
    @user = User.new(email: auth_params.info.email, password: Devise.friendly_token.first(8))
    @user.save!
  rescue ActiveRecord::RecordInvalid => invalid
    user
  end

  def add_identity_to_user
    if @identity.user != @user
      @identity.user = @user
      @identity.save!
    end
  end

  def create_profile
    unless @user.profile
      @profile = Profile.new(first_name: auth_params.extra.raw_info.name)
      @profile.user = @user
      @profile.save!(validate: false)
    end
  end
end
