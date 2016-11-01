class CreateAuthenticateWithFacebookService
  attr_accessor :auth, :identity, :user

  def initialize(auth, signed_in_resource =  nil)
    @auth = auth
    @identity = Identity.find_or_create_by(uid: auth.uid, provider: auth.provider)
    @user = signed_in_resource ? signed_in_resource : @identity.user
  end

  def auth
    find_or_create_user
  end

  private

  def find_or_create_user
    ActiveRecord::Base.transaction do
      build_user
      build_identity
    end

    @user
  end

  def build_user
    if @user.nil?
      @user = User.new(email: @auth.info.email, password: Devise.friendly_token[0, 8])
      @user.save
    end
  end

  def build_identity
    if @identity.user != @user
      @identity.user = @user
      @identity.save
    end
  end
end
