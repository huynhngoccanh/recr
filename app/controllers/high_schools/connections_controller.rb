class HighSchools::ConnectionsController < ApplicationController
  include HighSchoolScoped

  layout "profile"

  def index
    @connections = @high_school.connections.committed.page(params[:page])
  end
end
