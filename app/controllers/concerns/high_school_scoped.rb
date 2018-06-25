module HighSchoolScoped
  extend ActiveSupport::Concern

  included do
    before_action :set_high_school
  end

  private

    def set_high_school
      @high_school = HighSchool.find(params[:high_school_id])
    end
end
