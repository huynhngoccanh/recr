class Position

  def self.abbreviated_options
    abbreviations_hash.map { |position| [position[1], position[1]] }
  end

  def self.full_position_names
    abbreviations_hash.keys
  end

  def self.position_types
    Position.full_position_names.map { |position| "Position::#{position.to_s}" }
  end

  def self.abbreviations
    abbreviations_hash.values
  end

  def self.full_name(abbreviation)
    hash_entry = abbreviations_hash.select { |pos| abbreviations_hash[pos] == abbreviation }
    hash_entry&.first&.first
  end

  def self.abbreviations_hash
    {
      Quarterback:        "QB",
      RunningBack:        "RB",
      Fullback:           "FB",
      WideReceiver:       "WR",
      TightEnd:           "TE",
      Center:             "C",
      Guard:              "G",
      LeftGuard:          "LG",
      RightGuard:         "RG",
      Tackle:             "T",
      LeftTackle:         "LT",
      RightTackle:        "RT",
      DefensiveEnd:       "DE",
      DefensiveTackle:    "DT",
      NoseTackle:         "NT",
      InsideLinebacker:   "ILB",
      OutsideLinebacker:  "OLB",
      MiddleLinebacker:   "MLB",
      Cornerback:         "CB",
      FreeSafety:         "FS",
      StrongSafety:       "SS",
      Punter:             "P",
      PuntReturner:       "PR",
      Kicker:             "K",
      KickReturner:       "KR",
    }.with_indifferent_access
  end

  def self.offensive_positions
    %w(QB RB FB WR TE OL C G LG RG T LT RT)
  end

  def self.defensive_positions
    %w(DE DT NT ILB OLB MLB CB FS SS )
  end

  def self.special_teams_positions
    %w(P PR K KR)
  end
end
