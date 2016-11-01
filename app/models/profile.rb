class Profile < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :first_name, presence: true
  validates :first_last_name, presence: true
  validates :birth_date, presence: true
  validates :curp, presence: true
  validates :gender, presence: true
  validates :birth_state, presence: true

  enum gender: [:female, :male]
end
