class Requisition < ActiveRecord::Base
  PERSONAL_REFERENCES_COUNT = 3

  has_many :personal_references, dependent: :destroy
  belongs_to :user

  validate :check_profile
  validates :user, presence: true
  validates :income, presence: true
  validates :address_years, presence: true
  validates :marital_status, presence: true
  validates :requested_amout, presence: true
  validates :payment_terms, presence: true
  validates :bank, presence: true
  validates :company_name, presence: true
  validates :company_phone_number, presence: true
  validates :company_position, presence: true

  enum marital_status: [:single, :engaged, :married, :divorced, :widower]
  enum payment_terms: [:counted, :payment_one, :payment_second, :payment_third]

  private

  def check_profile
    errors.add(:base, 'Para crear una solicitud debe completar su perfil') unless user && user.profile&.valid?
  end
end
