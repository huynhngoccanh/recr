class Connection::Create
  attr_accessor :params, :athlete, :college, :perspective

  def initialize(params, perspective, current_user)
    @params = params
    @perspective = perspective
    @current_user = current_user

    if perspective.is_a?(Athlete)
      @athlete = perspective
      set_college
    else
      @college = perspective
      set_athlete
    end
  end

  def save
    @connection = Connection.where(athlete: @athlete, college: @college).first_or_initialize
    @connection.set_perspective(@current_user.membershipable)
    @connection.last_modified_by_id = @current_user.id
    if perspective.is_a?(Athlete)
      @connection.athlete_approved = true
    else
      @connection.college_approved = true
    end
    @connection.save
  end

  def errors
    @connection.errors
  end

  def connection
    @connection
  end

  private

    def set_athlete
      @athlete = Athlete.find(params[:athlete_id])
    end

    def set_college
      case params[:college_type]
      when "College"
        @college = College.find(params[:college_id])
      else
        raise InvalidcollegeError
      end
    end
end
