class HighSchools::RostersController < ApplicationController
  include HighSchoolScoped

  layout "profile"

  def index
    @athletes = @high_school.roster
  end
end
