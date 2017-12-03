class CommentsController < ApplicationController
  def create
    article = Article.find(params[:article_id])
    @comment = Comment.new(body: params[:body], email: params[:email], article: article)
    if @comment.save
      flash[:article] = 'Comment has been posted'
    else
      errors = ''
      @comment.errors.full_messages.each do |message|
        errors += message
      end
      flash[:article] = errors
    end
    redirect_to article_path(article)
  end
end
