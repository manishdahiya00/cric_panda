module Admin
  class ArticlesController < ApplicationController
  layout  "admin"
  before_action :set_article, only: %i[ show edit update destroy ]
  def index
     if params[:title].present?
      @articles = Article.where("title LIKE ?", "%#{params[:title]}%").order("id DESC").page(params[:page])
    else
    @articles = Article.all.order("id DESC").page(params[:page])
    end
  end
  def show
  end
  def new
    @article = Article.new
  end
  def edit
  end
  def create
    @article = Article.new(article_params)
      if @article.save
         redirect_to admin_article_url(@article), notice: "Article was successfully created."
      else
       render :new, status: :unprocessable_entity
    end
  end
  def update
      if @article.update(article_params)
         redirect_to admin_article_url(@article), notice: "Article was successfully updated."
      else
        render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @article.destroy!
      redirect_to admin_articles_url, notice: "Article was successfully destroyed."
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end
    def article_params
      params.require(:article).permit(:title, :description, :img_url, :published_date, :highlight, :category, :permalink)
    end
end

end