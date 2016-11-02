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

  accepts_nested_attributes_for :personal_references, allow_destroy: true

  def self.marital_status_attributes_for_select
    marital_statuses.map do |marital_status, _|
      [I18n.t("enums.marital_status.#{marital_status}"), marital_status]
    end
  end

  def self.payment_terms_attributes_for_select
    payment_terms.map do |payment_term, _|
      [I18n.t("enums.payment_terms.#{payment_term}"), payment_term]
    end
  end

  private

  def check_profile
    errors.add(:base, I18n.t('messages.missing_profile_model')) unless user && user.profile&.valid?
  end
end
