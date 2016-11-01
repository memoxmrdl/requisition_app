class PersonalReference < ActiveRecord::Base
  belongs_to :requisition

  validates :first_name, presence: true
  validates :second_name, presence: true
  validates :cell_phone_number, presence: true
end
