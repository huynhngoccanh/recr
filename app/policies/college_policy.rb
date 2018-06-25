class CollegePolicy
  attr_accessor :college, :user, :relationship

  def initialize(college, user)
    @college = college
    @user = user
    @relationship = CollegeRelationship.new(college: college, user: user)
  end

  def edit?
    case relationship.type
    when "admin", "affiliated_coach"
      true
    else
      false
    end
  end
end
