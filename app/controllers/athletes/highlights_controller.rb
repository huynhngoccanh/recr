class Athletes::HighlightsController < ApplicationController
  include AthleteScoped

  layout "profile"

  def index
    @highlights = @athlete.highlights.page(params[:page])
  end

  def show
    @highlightable = @athlete
    @highlight = @athlete.highlights.find(params[:id])
  end
end
