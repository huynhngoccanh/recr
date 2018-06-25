class Athletes::Administration::StatsController < Athletes::AdministrationController
  def index
    @stat_board = @athlete.stat_board(params.fetch(:state, "edit"), params.dig(:position), params.dig(:season))
  end

  def update
    load_stat
    verify_position_type
    assign_position

    @stat.last_modified_by_id = current_user.id

    if @stat.save
      redirect_to athlete_administration_stats_path(@athlete, position: @stat.position.position_name, season: @stat.position.season)
    else
      @stat_board = @athlete.stat_board("edit", @stat.position.position_name, @stat.position.season)
      render "edit_index", as: :html
    end
  end

  def create
    build_stat
    verify_position_type
    assign_position

    @stat.last_modified_by_id = current_user.id

    if @stat.save
      redirect_to athlete_administration_stats_path(@athlete, position: @stat.position.position_name, season: @stat.position.season)
    else
      @stat_board = @athlete.stat_board("edit", @stat.position.position_name, @stat.position.season)
      render "edit_index", as: :html
    end
  end

  def primary_position
    @athlete.update(primary_position: params[:stat_id])
    @stat_board = @athlete.build_stat_board("edit")
    render "edit_index"
  end

  def destroy
    if @athlete.position(params[:id]).all.destroy_all
      @stat_board = @athlete.stat_board("edit", params.dig(:position), params.dig(:season))
      respond_to do |format|
        format.js
        format.html {redirect_to athlete_administration_stats_path(@athlete) }
      end
    end
  end

  private

    def stat_params
      stat_params = params[:stat]
      stat_params ? stat_params.permit(:athlete_id, :position_id, :position_type) : {}
    end

    def load_stats
      @stats ||= stat_scope.to_a
    end

    def load_stat
      @stat = stat_scope.find(params[:id])
    end

    def build_stat
      @stat ||= stat_scope.build
      assign_position
    end

    def position_attributes
      position_type = params[:stat][:position_type]
      position_class = position_type.constantize
      position_class.new.stat_attributes.map(&:to_sym).push(:season)
    end

    def assign_position
      @position = @stat.position || params[:stat][:position_type].constantize.new
      @position.attributes = position_params(position_attributes)
      @stat.position = @position
    end

    def position_params(position_attributes)
      params[:stat][:position_attributes].permit(position_attributes)
    end

    def stat_scope
      @athlete.stats
    end

    def verify_position_type
      # make sure that this is a value we can trust before we interpolate it
      unless Position.full_position_names.include?(params[:stat][:position_type].split("::").last)
        render nothing: true, status: :bad_request
      end
    end
end
