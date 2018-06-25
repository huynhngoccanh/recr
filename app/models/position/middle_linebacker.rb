class Position::MiddleLinebacker < ApplicationRecord
  include Positionable

  has_many :stats
  has_many :athletes, through: :stats

  validates_presence_of :season
  validates_inclusion_of :season, in: 1980..3000
  validates :sacks, :interceptions, :forced_fumbles, :tackles, :tackles_for_loss, :pass_breakups, :defensive_touchdowns, {presence: true, numericality: true}
end
