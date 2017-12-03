class CommentsController < ApplicationController
  def create
    article = Article.find_by(id: params[:article_id])
  end
end
