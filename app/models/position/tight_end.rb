class Position::TightEnd < ApplicationRecord
  include Positionable

  has_many :stats
  has_many :athletes, through: :stats

  validates_presence_of :season
  validates_inclusion_of :season, in: 1980..3000
  validates :receiving_yards, :receiving_touchdowns, :catches, {presence: true, numericality: true}
end
