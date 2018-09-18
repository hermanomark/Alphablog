class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  # it's up to you to name this but it should be plural like @articles
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    
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

  end

  def update
    # very similar for create function we have to pass the whitelist article_params
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path
  end

  # whitelist params
  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description)
    end
end