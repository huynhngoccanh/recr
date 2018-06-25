class Colleges::Administration::CoachesController < Colleges::AdministrationController
  before_action :set_coach

  def index
  end

  def update
    @coach.update coach_params
  end

  private
    def set_coach
      @coach = @college.coaches.find(params[:id])
    end

    def coach_params
      params.require(:coach).permit(:role)
    end
end
