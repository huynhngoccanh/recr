class HighSchoolPolicy
  attr_accessor :high_school, :user, :relationship

  def initialize(high_school, user)
    @high_school = high_school
    @user = user
    @relationship = HighSchoolRelationship.new(high_school: high_school, user: user)
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
