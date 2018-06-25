class Athletes::Administration::ConnectionsController < Athletes::AdministrationController

  def index
    @connections = connection_scope.all
  end

  def edit
    load_connection
  end

  def create
    @connection = @athlete.connections.new(connection_params)
    @connection.athlete_approved = true
    @connection.last_modified_by_id = current_user

    if @connection.save
      respond_to do |format|
        format.html {redirect_to college_path(@connection.college)}
      end
    else
      redirect_to college_path(@connection.college), notice: "Couldn't connect!"
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
      format.html { redirect_to athlete_administration_connections_path(@athlete), notice: "Connection Deleted" }
    end
  end

  private

    def load_connections
      @connections = connection_scope.paginate.page(params[:page])
    end

    def load_connection
      @connection = connection_scope.find(params[:id])
    end

    def connection_scope
      @athlete.connections
    end

    def build_connection
      @connection ||= connection_scope.build
      @connection.attributes = connection_params
    end

    def connection_params
      connection_params = params[:connection]
      connection_params ? connection_params.permit(:college_id, :athlete_approved, :committed, :letter_of_intent_signed) : {}
    end

    def save_connection
      if @connection.save
        respond_to do |format|
          format.js { render "update" }
          format.html { redirect_to athlete_administration_connections_path(@athlete), notice: "connection Saved!" }
        end
      end
    end
end
