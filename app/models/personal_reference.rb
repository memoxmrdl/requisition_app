class PersonalReference < ActiveRecord::Base
  belongs_to :requisition

  validates :first_name, presence: true
  validates :first_last_name, presence: true
  validates :second_last_name, presence: true
  validates :cell_phone_number, presence: true
end
