class StatBoard::Edit
  attr_accessor :athlete, :selected_position, :selected_season
  def initialize(stat_board, athlete, position=nil, season = nil)
    @stat_board = stat_board
    @athlete = athlete
    @selected_position = resolve_position(position)
    @selected_season = season || athlete.potential_seasons.first
  end

  def resolve_position(position)
    if !position.nil?
      athlete.position(position)
    elsif athlete.positions.any?
      athlete.positions.first
    elsif athlete.primary_position?
      athlete.position(athlete.primary_position)
    else
      @stat_board.render_as!("add_position")
    end
  end

  def position
    @position ||= athlete.send(selected_position.to_relation).where(season: selected_season).first_or_initialize
  end

  def stat
    @stat ||= athlete.stats.where(position: position).first_or_initialize
  end

  def positions
    athlete.positions.map do |position|
      PositionOption.new(position, position.name == selected_position.name)
    end
  end

  def seasons
    selectable_seasons = athlete.potential_seasons
    selectable_seasons.map do |season|
      SeasonOption.new(season,
                       season.to_s == selected_season.to_s,
                       !(selected_position.all.where(season: season).any?)
                      )
    end
  end

  def new_position_allowed?
    athlete.positions.count < Athlete.max_positions
  end

  def to_partial_path
    "athletes/stat_board/edit"
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

  class SeasonOption
    def initialize(year, active = false, pending = false)
      @year = year
      @active = active
      @pending = pending
    end

    def year; @year; end
    def active?; @active; end
    def pending?; @pending; end

    def status
      if active?
        "active"
      elsif pending?
        "pending"
      else
        ""
      end
    end
  end
end
