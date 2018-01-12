class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:article] = 'Article was successfully created.'
      redirect_to @article
    else
      flash[:article] = @article.errors.full_messages
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params[:article].permit(:title, :content, :author)
  end
end
