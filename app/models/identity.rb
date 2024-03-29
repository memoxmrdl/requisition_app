class Identity < ActiveRecord::Base
  belongs_to :user

  validates :provider, presence: true
  validates :uid, presence: true
  validates :provider, uniqueness: { scope: :uid }
end
