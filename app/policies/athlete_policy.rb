class AthletePolicy
  attr_accessor :athlete, :user, :relationship

  def initialize(athlete, user)
    @athlete = athlete
    @user = user

    @relationship = AthleteRelationship.new(athlete, user)
  end

  def show_references?
    case relationship.type
    when "self", "high_school_coach", "connected_college_coach", "admin"
      true
    else
      false
    end
  end

  def edit?
    case relationship.type
    when "self", "admin", "high_school_coach"
      true
    else
      false
    end
  end
end
