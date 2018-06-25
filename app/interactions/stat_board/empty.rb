class StatBoard::Empty
  def initialize(stat_board=nil, athlete=nil, season=nil, position=nil)
  end

  def to_partial_path
    "athletes/stat_board/empty"
  end
end
