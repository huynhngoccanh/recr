module CollegeHelper
  def priveleged?(user, college)
    return false if user.nil?
    user.admin? || (user.college_coach? && user.profile.school == college)
  end
end
