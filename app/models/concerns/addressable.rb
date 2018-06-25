require 'active_support/concern'

module Addressable
  extend ActiveSupport::Concern

  included do
    has_one :address, as: :owner
    validates_associated :address
    accepts_nested_attributes_for :address, allow_destroy: true, reject_if: :all_blank

    delegate :state, :city, :full_address, to: :address
  end
end

