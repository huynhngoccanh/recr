module CollegeScoped
  extend ActiveSupport::Concern

  included do
    before_action :set_college
    before_action :build_college_profile_presenter
  end

  private

    def set_college
      @college = College.find(params[:college_id])
    end

    def build_college_profile_presenter
      @college_profile_presenter = CollegeProfilePresenter.new(@college, current_user)
    end
end
