class AthleteRelationship
  attr_accessor :athlete, :user

  def initialize(athlete, user)
    @athlete = athlete
    @user = user || User.new
  end

  def type
    return "self" if user.athlete? && (user.profile == athlete)
    return "admin" if user.admin?
    return "high_school_coach" if user.high_school_coach? && Enrollment.approved.exists?({athlete: athlete, high_school: user.profile.school})
    return "connected_college_coach" if user.college_coach? && Connection.exists?({athlete: athlete, user: user})
    return "unconnected_college_coach" if user.college_coach? && !Connection.exists?({athlete: athlete, user: user})
    "uninvolved"
  end
end
