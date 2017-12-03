class CommentsController < ApplicationController
  def create
    article = Article.find(params[:article_id])
    @comment = Comment.new(body: params[:body], email: params[:email], article: article)
    @comment.save
    flash[:article] = 'Comment has been posted'
    redirect_to article_path(article)
  end
end
