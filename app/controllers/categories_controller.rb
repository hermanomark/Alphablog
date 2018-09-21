class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
   @category = Category.new
  end

  def show

  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category was created succesfully"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  # anything you put in private it will only be available in that controller
  private
    def category_params
      params.require(:category).permit(:name)
    end
end