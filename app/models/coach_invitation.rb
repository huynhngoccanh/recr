class CoachInvitation
  include ActiveModel::Model
  attr_reader :params, :school, :new_invites, :current_user

  def initialize(params={}, school = nil, current_user = nil)
    @params = params
    @school = school
    @current_user = current_user

    @new_invites = new_invite_params(params) unless params.empty?
  end

  def save
    new_invites.each do |invite|
      user = invite_user(invite[:email], current_user)
      coach = create_coach_profile(user, invite[:first_name], invite[:last_name])
      affiliate_coach_and_school(coach, school)
    end
    true
  end

  private

    def invite_user(email, invited_by)
      User.invite!({email: email}, invited_by)
    end

    def create_coach_profile(user, first_name, last_name)
      coach = Coach.new(first_name: first_name, last_name: last_name, role_name: "Coach")
      coach.save
      user.update(profile: coach)
      user.profiled!
      coach
    end

    def affiliate_coach_and_school(coach, school)
      Affiliation.create(coach: coach, organization: school)
    end

    def new_invite_params(params)
      params[:new].delete_if { |user| user[:email].empty? || user[:first_name].empty? || user[:last_name].empty? }
    end
end

