class LandingController < ApplicationController
  def index
    @articles = Article.all
  end

  private

  def article_timestamp
    time = params[:article].permit(:created_at)
    time.strftime('at %F')
  end
end
