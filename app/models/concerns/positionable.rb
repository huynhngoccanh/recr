require 'active_support/concern'

module Positionable
  extend ActiveSupport::Concern

  included do
    def position_name
      self.class.to_s.split("::").last
      # Position::Kicker -> Kicker
    end

    def abbreviation
      self.class.abbreviations_hash[self.position_name]
    end

    def offensive?
      offensive_positions.include?(self.abbreviation)
    end

    def defensive?
      defensive_positions.include?(self.abbreviation)
    end

    def special_teams?
      special_teams_positions.include?(self.abbreviation)
    end

    def stat_attributes
      non_stat_attributes = %w(id created_at updated_at season)
      attributes.keys.keep_if { |attribute| !(non_stat_attributes.include?(attribute)) }
    end

    def to_partial_path
      "athletes/stats/position"
    end

    def to_edit_path
      "athletes/stats/form"
    end
  end

  class_methods do
    def abbreviations_hash
      Position.abbreviations_hash
    end

    def offensive_positions
      Position.offensive_positions
    end

    def defensive_positions
      Position.defensive_positions
    end

    def special_teams_positions
      Position.defensive_positions
    end
  end
end
