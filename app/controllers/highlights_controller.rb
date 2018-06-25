class HighlightsController < ApplicationController
  before_action :authenticate_user!, only: [:like, :unlike]

  def index
    load_highlights
  end

  def show
    load_highlight
  end

  private
    def load_highlights
      @highlights = highlight_scope.all.page(params[:page])
    end

    def load_highlight
      @highlight = highlight_scope.find(params[:id])
    end

    def highlight_scope
      @highlightable.highlights
    end

    def build_highlight
      @highlight ||= highlight_scope.build
      @highlight.attributes = highlight_params
    end

    def highlight_params
      highlight_params = params[:highlight]
      highlight_params ? highlight_params.permit(:title, :description, :raw_url, tagged_positions: []) : {}
    end

    def save_highlight
      if @highlight.save
        respond_to do |format|
          format.js { render "update" }
          format.html { redirect_to [:edit, @highlightable, :highlights], notice: "Highlight Saved!" }
        end
      end
    end
end
