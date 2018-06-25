class Colleges::Administration::HighlightsController < Colleges::AdministrationController
  before_action :set_highlightable

  def index
    load_highlights
    build_highlight
  end

  def show
    load_highlight
  end

  def new
    build_highlight
  end

  def edit
    load_highlight
  end

  def create
    @highlight = @highlightable.highlights.build highlight_params
    if @highlight.save
      redirect_to [@highlightable, :administration, :highlights], notice: "Congrats! Your highlight is up"
    else
      render "new"
    end
  end

  def update
    load_highlight
    build_highlight
    save_highlight or render "edit"
  end

  def destroy
    load_highlight
    @id = @highlight.id
    @highlight.destroy
  end

  private
    def set_highlightable
      @highlightable = @college
    end

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
          format.html { redirect_to [@highlightable, :administration, :highlights], notice: "Highlight Saved!" }
        end
      end
    end
end
