class Athletes::EnrollmentsController < ApplicationController
  skip_before_action :verify_registration_completed
  before_action :set_athlete
  before_action :initialize_high_school
  before_action :check_if_enrolled

  layout "application"

  def new
    @enrollment = @athlete.build_enrollment
  end

  def create
    @enrollment = @athlete.build_enrollment enrollment_params

    if @enrollment.save
      if current_user.completed_registration?
        redirect_to athlete_path(@athlete)
      else
        current_user.complete_registration!
        redirect_to athlete_path(@athlete)
      end
    else
      render "new"
    end
  end

  def destroy
    @enrollment = @athlete.enrollment
    @enrollment.destroy
    redirect_to edit_user_registration_path, notice: "Your enrollment has been cancelled."
  end

  private

    def set_athlete
      @athlete = Athlete.find(params[:athlete_id])
    end

    def initialize_high_school
      @high_school = HighSchool.new
      @high_school.build_address
    end

    def enrollment_params
      params.require(:enrollment).permit(:high_school_id)
    end

    def check_if_enrolled
      redirect_to athlete_path(@athlete) if @athlete&.enrollment&.high_school.present?
    end
end
