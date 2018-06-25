class CollegeOnboarding
  include ActiveModel::Model
  attr_reader :college, :address, :user, :coach, :affiliation, :address

  def initialize(params={})
    @params = params
    initialize_user
    initialize_coach
    initialize_college
    initialize_address
  end

  def valid?
    @college.valid? || @coach.valid? || @user.valid? || @address.valid?
  end

  def save
    return false unless valid?
    begin
      ActiveRecord::Base.transaction do
        @user.role = "profiled"
        @user.save!
        @user.complete_registration!

        @coach.save!
        @user.update!(profile: @coach)

        @college.address = @address
        @college.save!

        @address.save!

        @affiliation = @coach.build_affiliation(organization: @college, organization_approved: true)
        @affiliation.save!
      end
      true
    rescue ActiveRecord::RecordInvalid
      false
    end
  end

  def college_params
    params[:college] || {}
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

    def initialize_college
      @college = College.new college_params
    end

    def initialize_address
      @address = Address.new address_params
    end

    def params
      @params
    end
end
