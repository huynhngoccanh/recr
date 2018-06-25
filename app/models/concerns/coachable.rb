require 'active_support/concern'

module Coachable
  extend ActiveSupport::Concern

  included do
    has_many :affiliations, as: :organization
    has_many :coaches, through: :affiliations
    has_many :coach_users, through: :coaches, source: :user
  end

  def head_coach
    coaches.where(role: "head_coach").first
  end

  def affiliated_with?(user)
    coach_users.include?(user)
  end

  module ClassMethods
  end
end

