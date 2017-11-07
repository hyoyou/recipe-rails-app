require 'pry'

class RatingsController < ApplicationController
  def index
    @ratings =  Rating.all
    @recipe = Recipe.find(params[:recipe_id])
  end

  def new
    #raise params.inspect
    #{"controller"=>"ratings", "action"=>"new", "recipe_id"=>"2"}
    @rating = Rating.new
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    #binding.pry
    @rating = current_user.ratings.build(rating_params)
    if @rating.save
      @recipe = Recipe.find(params[:recipe_id])
      redirect_to recipe_ratings_path(@recipe)
    else
      render :new
    end
  end

  private
  def rating_params
    params.require(:rating).permit(:rating, :user_id, :recipe_id)
  end
end
