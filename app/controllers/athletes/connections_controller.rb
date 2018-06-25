class Athletes::ConnectionsController < ApplicationController
  include AthleteScoped

  layout "profile"

  def index
    @connections = @athlete.connections.page(params[:page])
  end

  def show
    load_connection
  end

end
