require 'pry'

class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    7.times do
      #@recipe.ingredients.build
      @recipe.ingredients.build.recipe_ingredients.build
    end
  end

  def create
    #raise params.inspect
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def show
    #binding.pry
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients.all
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :description, :user_id, :category_id, ingredients_attributes: [:name, recipe_ingredients_attributes: [:quantity, :key_ingredient]])
  end
end
