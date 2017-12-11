class RatingsController < ApplicationController
  before_action :set_recipe, only: [:index, :new, :create]

  def index
  end

  def new
    @rating = Rating.new
  end

  def create
    @rating = current_user.ratings.build(rating_params)
    if @rating.save
      redirect_to recipe_ratings_path(@recipe)
    else
      render :new
    end
  end

  private
  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def rating_params
    params.require(:rating).permit(:rating, :user_id, :recipe_id)
  end
  
end
