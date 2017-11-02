require 'pry'

class RecipesController < ApplicationController
  include RecipesHelper

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    7.times do
      ingredient = @recipe.ingredients.build
      ingredient.recipe_ingredients.build
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def create
    #raise params.inspect
    @recipe = current_user.recipes.build(name: params[:recipe][:name], description: params[:recipe][:description], category_id: params[:recipe][:category_id])
    if @recipe.save
      save_recipe_ingredients(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    if @recipe.save
      save_recipe_ingredients(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def show
    #binding.pry
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients.all
    #binding.pry
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name,
                                   :description,
                                   :user_id,
                                   :category_id,
                                   ingredients_ids: [],
                                   ingredients_attributes: [:name, recipe_ingredients_attributes: [:quantity, :key_ingredient]])
  end
end
