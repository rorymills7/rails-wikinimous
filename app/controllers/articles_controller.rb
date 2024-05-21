class ArticlesController < ApplicationController
  before_action :get_article, only: [:show, :edit, :destroy, :update]
  def index
    @articles = Article.all
  end
  def show ; end
  def new
    @article = Article.new
  end
  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_path
  end
  def edit ; end
  def update
    @article.update(article_params)
    redirect_to articles_path
  end
  def destroy
    @article.destroy
    redirect_to articles_path
  end
  private
  def article_params
    params.require(:article).permit(:title, :content)
  end
  def get_article
    @article = Article.find(params[:id])
  end
end
