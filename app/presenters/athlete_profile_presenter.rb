class AthleteProfilePresenter
  attr_accessor :athlete, :current_user

  def initialize(athlete, current_user)
    @athlete = athlete
    @current_user = current_user || User.new
  end

  # Jumbotron Logic
  def display_high_school?
    athlete.high_school.present?
  end

  def college_coach_is_viewing?
    current_user.college_coach?
  end

  def user_is_profile_owner?
    athlete == current_user&.profile
  end

  def already_connected?
    Connection.exists?({athlete: athlete, user: current_user})
  end

  def can_connect?
    college_coach_is_viewing? && !Connection.exists?({athlete: athlete, user: current_user})
  end

  def conversation_allowed?
    Conversation.allowed?(current_user, athlete)
  end

  def can_request_transcript?
    athlete.high_school.present? && athlete.high_school.transcript_requests_enabled?
  end
end

