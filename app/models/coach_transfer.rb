class CoachTransfer
  include ActiveModel::Model

  attr_reader :coach_email, :school, :coach, :affiliation

  def initialize(coach_email, school)
    @coach_email = coach_email
    @school = school
    @coach = set_coach
  end

  def save
    validate_transfer!

    unless self.errors.any?
      @affiliation = Affiliation.new(coach: coach, organization: school)
      @affiliation.save
    else
      return false
    end
  end

  private
    def validate_transfer!
      unless coach_is_present?
        self.errors[:base] << "We can't find a coach with this email."
        return false
      end

      unless coach_is_available?
        self.errors[:base] << "This coach is still affiliated with another school."
        return false
      end
    end

    def set_coach
      user = User.where(email: coach_email).first
      return user&.profile
    end

    def coach_is_present?
      coach && coach.is_a?(Coach)
    end

    def coach_is_available?
      coach.affiliation == nil
    end
end
