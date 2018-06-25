class Athletes::AdministrationController < ApplicationController
  include AthleteScoped

  before_action :verify_authorized

  layout "profile"

  private
    def verify_authorized
      redirect_to root_path unless AthletePolicy.new(@athlete, current_user).edit?
    end
end
