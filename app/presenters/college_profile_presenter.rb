class CollegeProfilePresenter
  attr_accessor :college, :current_user

  def initialize(college, current_user)
    @college = college
    @current_user = current_user || User.new
  end

  def athlete_is_viewing?
    current_user&.profile.is_a?(Athlete)
  end

  def athlete_already_connected?
    Connection.exists?(athlete: current_user.profile, college: @college)
  end

  def athlete_can_connect?
    !athlete_already_connected? && (current_user.profile.seniority != "freshman")
  end

  def user_is_profile_owner?
    college == current_user&.profile&.school
  end
end
