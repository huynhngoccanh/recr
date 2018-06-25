class HighSchoolRelationship
  attr_accessor :high_school, :user

  def initialize(high_school:, user:)
    @high_school = high_school
    @user = user || User.new
  end

  def type
    return "admin" if user.admin?
    return "affiliated_coach" if user.high_school_coach? && high_school.affiliated_with?(user)
    "uninvolved"
  end
end

