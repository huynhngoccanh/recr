class Position::Punter < ApplicationRecord
  include Positionable

  has_many :stats
  has_many :athletes, through: :stats

  validates_presence_of :season
  validates_inclusion_of :season, in: 1980..3000
  validates :punts, :yards_per_attempt, :longest_punt, {presence: true, numericality: true}
end
