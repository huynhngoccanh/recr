class StatBoard
  attr_reader :athlete, :state

  STATES = ["edit", "view", "add_position", "empty"]

  def initialize(state, athlete, position=nil, season=nil)
    raise ArgumentError unless STATES.include?(state)
    raise ArgumentError unless athlete.is_a?(Athlete) && athlete.persisted?
    @athlete = athlete
    @state = state
    @selected_position  = position
    @selected_season    = season

    "StatBoard::#{state.camelcase}".constantize.new(self, athlete, @selected_position, @selected_season)
  end

  def render_as!(state)
    @state = state
  end

  def result
    "StatBoard::#{@state.camelcase}".constantize.new(self, @athlete, @selected_position, @selected_season)
  end
end
