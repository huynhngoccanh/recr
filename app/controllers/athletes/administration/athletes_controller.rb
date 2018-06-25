class Athletes::Administration::AthletesController < Athletes::AdministrationController

  def edit
  end

  def update
    @athlete.attributes = athlete_params

    respond_to do |format|
      if @athlete.save
        format.html { redirect_to edit_athletes_administration_athlete_path(@athlete) }
      else
        format.html { render "edit"}
      end
    end
  end

  private
    def set_athlete
      @athlete = Athlete.find(params[:id])
    end

    def athlete_params
      athlete_params = params[:athlete]
      athlete_params ? athlete_params.permit(:first_name, :last_name, :jersey_number, :primary_position, :jersey_number, :class_of, :height, :weight, :bench_press, :squat, :deadlift, :forty_yard_dash, :hundred_yard_dash, :avatar, :remove_avatar, :avatar_cache, :gpa, :display_gpa, :hudl_url,
                                             { secondary_positions: [] },
                                             user_attributes: [:id, :first_name, :last_name]) : {}
    end
end
