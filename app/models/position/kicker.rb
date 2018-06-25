class Position::Kicker < ApplicationRecord
  include Positionable

  has_many :stats
  has_many :athletes, through: :stats

  validates_presence_of :season
  validates_inclusion_of :season, in: 1980..3000
  validates :kicks_attempted, :kicks_made, :longest_kick, :touchbacks, :yards_per_attempt, {presence: true, numericality: true}
end
