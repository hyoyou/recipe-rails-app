class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    redirect_to ingredients_path
  end
end
