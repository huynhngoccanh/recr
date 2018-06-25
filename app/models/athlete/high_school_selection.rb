class Athlete::HighSchoolSelection
  attr_reader :high_school, :athlete

  def initialize(user, params)
    @user = user
    @params = params
    set_high_school
    @athlete = user.membershipable
  end

  def finish_athlete_registration?
    @athlete.nil?
  end

  def high_school_selected?
    @high_school.persisted?
  end

  def connect_existing_athlete?
    @athlete&.persisted? && high_school_selected?
  end

  def create_connection!
    Connection.create_as_athlete(@athlete, @high_school, @user)
  end

  private
    def set_high_school
      high_school = HighSchool.where(name: @params[:high_school_name]).first

      if high_school
        @high_school = high_school
      else
        @high_school = HighSchool.new
      end
    end
end
