class Athletes::Administration::ArticlesController < Athletes::AdministrationController

  def index
    load_articles
    build_article
  end

  def edit
    load_article
  end

  def create
    build_article
    save_article or render "index"
  end

  def update
    load_article
    build_article
    save_article or render "edit"
  end

  def destroy
    load_article
    @id = @article.id
    @article.destroy
  end

  private
    def load_articles
      @articles = article_scope.all.page(params[:page])
    end

    def load_article
      @article = article_scope.find(params[:id])
    end

    def article_scope
      @athlete.articles
    end

    def build_article
      @article ||= article_scope.build
      @article.attributes = article_params
    end

    def article_params
      article_params = params[:article]
      article_params ? article_params.permit(:title, :description, :raw_url, :athlete_id) : {}
    end

    def save_article
      if @article.save
        respond_to do |format|
          format.js { render "update" }
          format.html { redirect_to athlete_administration_articles_path(@athlete), notice: "article Saved!" }
        end
      end
    end

end
