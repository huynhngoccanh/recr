class Highlights::VotesController < ApplicationController
  before_action :authenticate_user!, only: [:like, :unlike]

  def like
    load_highlight
    @highlight.liked_by current_user
  end

  def unlike
    load_highlight
    @highlight.disliked_by current_user
  end

  private
    def load_highlight
      @highlight = Highlight.find(params[:id])
    end
end
