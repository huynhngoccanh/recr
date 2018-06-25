class HighSchoolOnboardingsController < ApplicationController
  def new
    @onboarding = HighSchoolOnboarding.new
  end

  def create
    @onboarding = HighSchoolOnboarding.new onboarding_params
    if @onboarding.save
      redirect_to high_school_path(@onboarding.high_school)
    else
      render "new"
    end
  end

  def onboarding_params
    params.require(:high_school_onboarding)
      .permit(
              user:         [:email, :password, :password_confirmation],
              coach:        [:first_name, :last_name, :role, :role_name],
              high_school:  [:name, :mascot, :enrollment, :school_email],
              address:      [:line1, :city, :state, :zip]
    )
  end
end
