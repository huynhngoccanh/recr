class Reference < ApplicationRecord
  belongs_to :athlete
  has_many :phone_numbers, as: :owner
  phony_normalize :phone_number, default_country_code: 'US'

  accepts_nested_attributes_for :phone_numbers, allow_destroy: true, reject_if: :all_blank
  validates_presence_of :name, :relationship, :contact_method, :email

  CONTACT_METHODS = ["phone", "email"]
  validates :contact_method, inclusion: {in: CONTACT_METHODS}
end
