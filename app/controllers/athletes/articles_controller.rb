class Athletes::ArticlesController < ApplicationController
  include AthleteScoped

  layout "profile"

  def index
    @articles = @athlete.articles.page(params[:page])
  end

  def show
    @article = @athlete.articles.find(params[:id])
  end
end
