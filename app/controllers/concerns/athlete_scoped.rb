module AthleteScoped
  extend ActiveSupport::Concern

  included do
    before_action :set_athlete
    before_action :build_athlete_profile_presenter
  end

  private

    def set_athlete
      @athlete = Athlete.find(params[:athlete_id])
    end

    def build_athlete_profile_presenter
      @athlete_profile_presenter = AthleteProfilePresenter.new(@athlete, current_user)
    end
end

