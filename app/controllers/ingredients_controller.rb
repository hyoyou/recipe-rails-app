class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:recipe_id])
    @recipe_ingredient = RecipeIngredient.find_by(recipe_id: @recipe, ingredient_id: params[:id])
    @recipe_ingredient.destroy
    redirect_to recipe_path(@recipe)
  end
end
