class CollegeRelationship
  attr_accessor :college, :user

  def initialize(college:, user:)
    @college = college
    @user = user || User.new
  end

  def type
    return "admin" if user.admin?
    return "affiliated_coach" if college.coach_users.include?(user)
    "uninvolved"
  end
end
