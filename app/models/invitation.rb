class AthleteInvitation
  include ActiveModel::Model
  attr_reader :params, :high_school, :new_invites, :current_user

  def initialize(params={}, high_school = nil, current_user = nil)
    @params = params
    @high_school = high_school
    @current_user = current_user

    @new_invites = new_invite_params(params) unless params.empty?
  end

  def save
    new_invites.each do |invite|
      user = invite_user(invite[:email], current_user)
      athlete = create_athlete_profile(user, invite[:first_name], invite[:last_name])
      enroll_athlete_in_high_school(athlete, high_school)
    end
    true
  end

  private

    def invite_user(email, invited_by)
      User.invite!({email: email}, )
    end

    def create_athlete_profile(user, first_name, last_name)
      athlete = Athlete.new(first_name: first_name, last_name: last_name)
      athlete.save(validate: false)
      user.update(profile: athlete)
      user.profiled!
      athlete
    end

    def enroll_athlete_in_high_school(athlete, high_school)
      Enrollment.create(athlete: athlete, high_school: high_school, high_school_approved: true)
    end

    def new_invite_params(params)
      params[:new].delete_if { |user| user[:email].empty? || user[:first_name].empty? || user[:last_name].empty? }
    end
end
