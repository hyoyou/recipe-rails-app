class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    if current_user.admin
      @category = Category.new
    else
      flash[:notice] = "Only admins can create categories. Please contact an admin to suggest a category."
      redirect_to categories_path
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
