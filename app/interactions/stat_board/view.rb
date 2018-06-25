class StatBoard::View
  attr_accessor :athlete, :selected_position, :selected_season

  def initialize(stat_board, athlete, position = nil, season = nil)
    @stat_board = stat_board
    @athlete = athlete

    unless athlete.stats.any?
      @stat_board.render_as!("empty")
    end

    @selected_position = position ? athlete.position(position) : athlete.positions.first
    @selected_season = season || "Career"
  end

  def to_partial_path
    "athletes/stat_board/view"
  end

  def positions
    athlete.positions.map do |position|
      PositionOption.new(position, position.name == @selected_position.name)
    end
  end

  def seasons
    selectable_seasons = ["Career", @selected_position.seasons.sort].flatten
    selectable_seasons.map do |season|
      SeasonOption.new(season, season.to_s == @selected_season.to_s )
    end
  end

  def result
    if @selected_season == "Career"
      existing_positions = athlete.send(selected_position.to_relation)
      result_position = selected_position.class_name.new

      result_position.stat_attributes.each do |stat|
        stat_value = existing_positions.map { |pos| pos.send(stat) }.sum
        result_position.send("#{stat}=", stat_value)
      end
      result_position
    else
      athlete.send(selected_position.to_relation).where(season: selected_season).first
    end
  end

  class SeasonOption
    def initialize(year, active = false)
      @year = year
      @active = active
    end

    def year; @year; end
    def active?; @active; end
  end

  class PositionOption
    def initialize(position, active = false)
      @position = position
      @active = active
    end

    def active?; @active; end
    def abbreviation; @position.abbreviation; end
    def name; @position.name; end
  end
end
