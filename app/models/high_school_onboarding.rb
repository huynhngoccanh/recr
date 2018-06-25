class HighSchoolOnboarding
  include ActiveModel::Model
  attr_reader :high_school, :address, :user, :coach, :affiliation, :address

  def initialize(params={})
    @params = params
    initialize_user
    initialize_coach
    initialize_high_school
    initialize_address
  end

  def valid?
    @high_school.valid? || @coach.valid? || @user.valid? || @address.valid?
  end

  def save
    return false unless valid?
    begin
      ActiveRecord::Base.transaction do
        @user.profiled!
        @user.save!
        @user.complete_registration!

        @coach.save!
        @user.update!(profile: @coach)

        @high_school.address = @address
        @high_school.save!

        @address.save!

        @affiliation = @coach.build_affiliation(organization: @high_school, organization_approved: true)
        @affiliation.save!
      end
      true
    rescue ActiveRecord::RecordInvalid
      false
    end
  end

  def high_school_params
    params[:high_school] || {}
  end

  def user_params
    params[:user] || {}
  end

  def coach_params
    params[:coach] || {}
  end

  def address_params
    params[:address] || {}
  end

  private
    def initialize_user
      @user = User.new user_params
    end

    def initialize_coach
      @coach = Coach.new coach_params
    end

    def initialize_high_school
      @high_school = HighSchool.new high_school_params
    end

    def initialize_address
      @address = Address.new address_params
    end

    def params
      @params
    end
end

