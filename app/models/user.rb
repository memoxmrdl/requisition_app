class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, dependent: :destroy
  has_many :identities, dependent: :destroy
end
