class Colleges::HighlightsController < HighlightsController
  include CollegeScoped
  before_action :set_highlightable

  layout "profile"

  def index
    super
  end

  def show
    super
  end

  private

    def set_highlightable
      @highlightable = @college
    end
end
