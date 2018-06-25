class StatBoard::AddPosition
  attr_accessor :athlete
  def initialize(stat_board, athlete, position=nil, season = nil)
    @stat_board = stat_board
    @athlete = athlete
  end

  def position_options
    existing_positions = athlete.positions.map &:abbreviation
    options = Position.abbreviations - existing_positions
    options.map { |option| [option, option] }
  end

  def season_options
    options = athlete.potential_seasons
    options.map { |option| [option, option] }
  end

  def cancelable?
    @athlete.stats.any?
  end

  def to_partial_path
    "athletes/stat_board/add_position"
  end
end
