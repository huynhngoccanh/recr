class CollegeOnboardingsController < ApplicationController
  def new
    @onboarding = CollegeOnboarding.new
  end

  def create
    @onboarding = CollegeOnboarding.new onboarding_params
    if @onboarding.save
      redirect_to college_path(@onboarding.college)
    else
      render "new"
    end
  end

  def onboarding_params
    params.require(:college_onboarding)
      .permit(
              user:         [:email, :password, :password_confirmation],
              coach:        [:first_name, :last_name, :role, :role_name],
              college:  [:name, :mascot, :division, :enrollment, :school_email, :gpa_requirement],
              address:      [:line1, :city, :state, :zip]
    )
  end
end
