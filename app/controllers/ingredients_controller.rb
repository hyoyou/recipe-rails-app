class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def destroy
    if params[:recipe_id]
      @recipe = Recipe.find_by(id: params[:recipe_id])
      @recipe_ingredient = RecipeIngredient.find_by(recipe_id: @recipe, ingredient_id: params[:id])
      @recipe_ingredient.destroy
      redirect_to recipe_path(@recipe)
    else
      @ingredient = Ingredient.find(params[:id])
      @ingredient.destroy
      redirect_to ingredients_path
    end
  end
  
end
