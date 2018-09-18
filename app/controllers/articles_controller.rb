class ArticlesController < ApplicationController
  
  # it's up to you to name this but it should be plural like @articles
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
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

  def update
    @article = Article.find(params[:id])
    # very similar for create function we have to pass the whitelist article_params
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  # whitelist params
  private

    def article_params
      params.require(:article).permit(:title, :description)
    end
end