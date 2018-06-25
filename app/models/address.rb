class Address < ApplicationRecord
  belongs_to :owner, polymorphic: true
  validates_presence_of :line1, :state, :city, :zip

  PERMITTED_ATTRIBUTES = [
    :line1,
    :city,
    :state,
    :zip,
    :_destroy
  ]

  def self.us_states
    ["AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", "GA", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD", "ME", "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE", "NH", "NJ", "NM", "NV", "NY", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VA", "VT", "WA", "WI", "WV", "WY"]
  end

  validates :state, inclusion: {in: Address.us_states}

  def full_address
    # TODO: change this method & all references to regional_info
    [city, state].join(", ")
  end

  def complete_address
    [line1, city, state, zip].join(", ")
  end
end
