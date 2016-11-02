class User < ActiveRecord::Base
  devise :database_authenticatable,:rememberable, :trackable, :validatable, :omniauthable

  has_one :profile, dependent: :destroy
  has_many :identities, dependent: :destroy
  has_many :requisitions, dependent: :destroy
end
