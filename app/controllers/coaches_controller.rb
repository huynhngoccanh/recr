class CoachesController < ApplicationController
  after_action :verify_authorized

  def show
    load_coach
  end

  def edit
    load_coach
  end

  def update
    load_coach
    build_coach
    save_coach or render "edit"
  end

  def order
    params[:coach].each_with_index do |id, index|
      Coach.find(id).update(position: index)
    end
    render status: 200, body: nil
  end

  private

    def load_coach
      @coach = Coach.find(params[:id])
    end

    def build_coach
      @coach ||= coach_scope.build
      @coach.attributes = coach_params
    end

    def save_coach
      if @coach.save
        respond_to do |format|
          format.js { render "update" }
          format.html { redirect_to [:edit, @coach], notice: "Your coach profile has been updated!" }
        end
      end
    end

    def coach_params
      coach_params = params[:coach]
      coach_params ? coach_params.permit(:role, :user_id, :bio, :avatar, :avatar_cache, :remove_avatar,
                                         phone_numbers_attributes: [:digits, :info, :id, :_destroy]) : {}
    end

    def verify_authorized
      redirect_to root_path unless current_user.admin? || (current_user.profile == @coach)
    end
end
