class Colleges::ConnectionsController < ApplicationController
  include CollegeScoped

  layout "profile"

  def index
    @connections = @college.connections.committed.page(params[:page])
  end

  def create
    @college.connections.create(athlete: current_user.profile)
    redirect_to @college, notice: "You're now connected!"
  end
end
