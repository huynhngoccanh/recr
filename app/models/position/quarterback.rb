class Position::Quarterback < ApplicationRecord
  include Positionable

  has_many :stats, dependent: :destroy
  has_many :athletes, through: :stats

  validates_presence_of :season
  validates_inclusion_of :season, in: 1980..3000
  validates :passing_yards, :passing_touchdowns, :rushing_yards, :rushing_touchdowns, {presence: true, numericality: true}
end
