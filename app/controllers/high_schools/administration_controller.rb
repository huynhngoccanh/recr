class HighSchools::AdministrationController < ApplicationController
  include HighSchoolScoped
  before_action :verify_authorized

  layout "profile"

  private
    def verify_authorized
      redirect_to root_path unless HighSchoolPolicy.new(@high_school, current_user).edit?
    end
end
