class AthletesController < ApplicationController
  layout :resolve_layout

  def index
    @athletes = Athlete::Search.new(params).search
  end

  def show
    load_athlete
    redirect_to athlete_connections_path(@athlete)
  end

  def stat_board
    load_athlete
    @stat_board = @athlete.stat_board("view", params.dig(:position), params.dig(:season))
  end

  def new
    build_athlete
  end

  def update
    load_athlete
    @athlete.update(athlete_params)
  end

  private

  def resolve_layout
    case action_name
    when "index", "new", "create"
      "application"
    else
      "profile"
    end
  end

  def load_athlete
    @athlete = athlete_scope.find(params[:id])
  end

  def athlete_scope
    Athlete
  end

  def build_athlete
    @athlete = athlete_scope.new
    @athlete.attributes = athlete_params
  end

  def athlete_params
    athlete_params = params[:athlete]
    athlete_params ? athlete_params.permit(:first_name, :last_name, :jersey_number, :primary_position, :jersey_number, :class_of, :height, :weight, :bench_press, :squat, :deadlift, :forty_yard_dash, :hundred_yard_dash, :avatar, :remove_avatar, :avatar_cache, :gpa, :display_gpa, :hudl_url,
                                           { secondary_positions: [] },
                                           user_attributes: [:id, :first_name, :last_name],
                                           phone_number_attributes: PhoneNumber::PERMITTED_ATTRIBUTES,
                                           address_attributes: Address::PERMITTED_ATTRIBUTES) : {}
  end

  def save_athlete
    if @athlete.save
      redirect_to athlete_path(@athlete)
    end
  end
end
