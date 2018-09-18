class ArticlesController < ApplicationController
  
  def index
    @article = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    # this line of code you could see the information being pass when you hit the submit button fron /articles/new
    # render plain: params[:article].inspect

    @article = Article.new(article_params)
    if @article.save
    #do something
      flash[:notice] = "Article was successfully created"
      # redirect to show path
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  # whitelist params
  private

    def article_params
      params.require(:article).permit(:title, :description)
    end
end