class Athletes::RegistrationsController < AthletesController
  skip_before_action :verify_registration_completed
  before_action :verify_profile_needed

  layout "application"

  def new
    @athlete = set_athlete

    if @athlete.persisted?
      show_errors = params[:dont_show_errors].present? ? "dont_show_errors" : "show_errors"
      redirect_to edit_athletes_registrations_path(show_errors => 1)
    end

    @athlete.user = current_user
  end

  def edit
    @athlete = set_athlete
  end

  def create
    @athlete = Athlete.new athlete_params
    # binding.pry
    if @athlete.save
      current_user.update(profile: @athlete)
      current_user.profiled!

      redirect_to new_athlete_enrollment_path(@athlete)
    else
      render :new
    end
  end


  def update
    @athlete = set_athlete

    if @athlete.update athlete_params
      current_user.profiled!

      redirect_to new_athlete_enrollment_path(@athlete)
    else
      render :new
    end
  end

  private

    def set_athlete
      if current_user&.profile && current_user.profile.is_a?(Athlete)
        @athlete = current_user.profile
      else
        @athlete = Athlete.new
      end
    end

    def athlete_params
      params.require(:athlete).permit(:first_name, :last_name, :primary_position, :jersey_number, :class_of, :height, :weight, :gpa, :display_gpa)
    end

    def verify_profile_needed
      if current_user.profile.present? && current_user.profile.valid?
        redirect_to current_user.profile, notice: "You already have a profile!"
      end
    end
end
