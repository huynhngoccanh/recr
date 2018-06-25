class Colleges::Administration::ConnectionsController < Colleges::AdministrationController

  def index
    @connections = connection_scope.all
  end

  def show
    load_connection
  end

  def edit
    load_connection
  end

  def create
    @connection = Connection.new(connection_params)
    @connection.college = @college
    @connection.last_modified_by_id = current_user

    if @connection.save
      respond_to do |format|
        format.js
        format.html {redirect_to athlete_path(@connection.athlete)}
      end
    else
      redirect_to athlete_path(@connection.athlete), notice: "Couldn't connect!"
    end
  end

  def update
    load_connection
    build_connection
    @connection.last_modified_by_id = current_user.id
    save_connection or render "edit"
  end

  def destroy
    load_connection
    @id = @connection.id
    @connection.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to college_administration_connections_path(@college), notice: "Connection Deleted" }
    end
  end

  private

    def load_connections
      @connections = connection_scope.page(params[:page])
    end

    def load_connection
      @connection = connection_scope.find(params[:id])
    end

    def connection_scope
      @college.connections
    end

    def build_connection
      @connection ||= connection_scope.build
      @connection.attributes = connection_params
    end

    def connection_params
      connection_params = params[:connection]
      connection_params ? connection_params.permit(:athlete_id, :college_id, :last_modified_by_id) : {}
    end

    def save_connection
      if @connection.save
        respond_to do |format|
          format.js { render "update" }
          format.html { redirect_to college_administration_connections_path(@college), notice: "connection Saved!" }
        end
      end
    end
end
