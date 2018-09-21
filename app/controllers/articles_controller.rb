class ArticlesController < ApplicationController
  # calling the set_article method from private only put for edit, update, show, destroy
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  # built method in application controller
  before_action :require_user, except: [:index, :show]
  # this is reference from the private
  before_action :require_same_user, only: [:edit, :update, :destroy]

  # it's up to you to name this but it should be plural like @articles
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    # debugger
    # this line of code you could see the information being pass when you hit the submit button fron /articles/new
    # render plain: params[:article].inspect

    @article = Article.new(article_params)
    # this will ensure that article must have a user_id, temporarily
    @article.user = current_user
    if @article.save
    #do something
      flash[:success] = "Article was successfully created"
      # redirect to show path
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    # very similar for create function we have to pass the whitelist article_params
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @article.destroy
    flash[:danger] = "Article was successfully deleted"
    redirect_to articles_path
  end

  # whitelist params
  private

    # fix redundancy for @article = Article.find(params[:id]) code in update, edit, show, destroy
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description)
    end

    def require_same_user
      # we know we can call current_user and @article_user because the before_action :set_article has been set
      # checks if the user is not current user and not an admin but current user is not article user but if current user is admin then this will allow this action
      if current_user != @article.user and !current_user.admin?
        flash[:danger] = "You can only edit or delete your own article"
        redirect_to root_path
      end
    end
end