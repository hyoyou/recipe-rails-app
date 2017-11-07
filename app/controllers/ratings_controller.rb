class RatingsController < ApplicationController
  def index
    @ratings =  Rating.all
  end

  def new
    raise params.inspect
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)
    if @rating.save?
      redirect_to recipe_ratings_path
    else
      render :new
    end
  end

  private
  def rating_params
    params.require(:rating).permit(:rating, :user_id, :recipe_id)
  end
end
