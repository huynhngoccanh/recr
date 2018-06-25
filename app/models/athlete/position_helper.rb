class Athlete::PositionHelper
  attr_accessor :athlete

  def initialize(position, athlete=nil)
    set_position_base(position)
    @athlete = athlete
  end

  def all
    athlete.send(to_relation)
  end

  def seasons
    athlete.send(to_relation).pluck(:season)
  end

  def class_name
    "Position::#{base}".constantize
  end

  def abbreviation
    Position.abbreviations_hash[base]
  end

  def name
    to_s
  end

  def to_s
    base
  end

  def to_relation
    "#{name.underscore}_stats"
  end

  private

    def base
      @base
    end

    def set_position_base(position)
      position = position.to_s

      if position.include?("::")
        position = position.split("::").last
      end

      if Position.abbreviations.include?(position.upcase)
        @base = Position.full_name(position)
      elsif Position.full_position_names.include?(position)
        @base = position
      end

      raise NoPositionError unless @base
    end
end
