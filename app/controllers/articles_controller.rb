class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    # this line of code you could see the information being pass when you hit the submit button fron /articles/new
    # render plain: params[:article].inspect

    @article = Article.new(article_params)
    @article.save
  end

  # whitelist params
  private

    def article_params
      params.require(:article).permit(:title, :description)
    end
end