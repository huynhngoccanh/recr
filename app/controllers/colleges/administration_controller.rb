class Colleges::AdministrationController < ApplicationController
  include CollegeScoped

  before_action :verify_authorized

  layout "profile"

  private
    def verify_authorized
      redirect_to root_path unless CollegePolicy.new(@college, current_user).edit?
    end
end
