class HighSchools::HighlightsController < HighlightsController
  include HighSchoolScoped
  before_action :set_highlightable

  layout "profile"

  private

    def set_highlightable
      @highlightable = @high_school
    end
end
