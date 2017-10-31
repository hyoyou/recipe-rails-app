class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    3.times do
      @recipe.ingredients.build
    end
  end

  def create
    raise params.inspect
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :description, :user_id, ingredients_attributes: [:name, recipe_ingredients_attributes: [:name, :key_ingredient]], category_ids: [])
  end
end
