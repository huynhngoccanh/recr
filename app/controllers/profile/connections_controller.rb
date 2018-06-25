class Profile::ConnectionsController < ApplicationController
  def create
    creator = Connection::Create.new(connection_params, current_user.profile, current_user)
    creator.save
    @connection = creator.connection

    respond_to do |format|
      format.js
      format.html { redirect_to :back}
    end
  end

  def update
    @connection = current_user.profile.connections.find(params[:id])
    @connection.attributes = connection_params
    @connection.last_modified_by_id = current_user.id
    @connection.set_perspective(current_user.membershipable)
    @connection.save

    respond_to do |format|
      format.js
      format.html { redirect_to :back}
    end
  end

  private

    def connection_params
      connection_params = params[:connection]
      connection_params.permit(:organization_type, :organization_id, :athlete_id, :athlete_approved, :organization_approved)
    end
end
