class PhoneNumber < ApplicationRecord
  belongs_to :owner, polymorphic: true

  phony_normalize :digits, default_country_code: 'US'

  PERMITTED_ATTRIBUTES = [
    :digits,
    :info,
    :id,
    :_destroy
  ]
end
