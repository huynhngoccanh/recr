class Stat < ApplicationRecord
  belongs_to :athlete
  belongs_to :position, polymorphic: true

  validates_presence_of :athlete, :position
  validates :position_type, inclusion: { in: Position.position_types }
  accepts_nested_attributes_for :position

  validate :only_one_position_per_stat_per_season, on: :create

  def only_one_position_per_stat_per_season
    if athlete.position(position_type).all.where(season: position.season).any?
      errors.add(:base, "Every athlete can only have one entry per position per season.")
    end
  end

  def last_modified_by
    User.find(last_modified_by_id)
  end
end
