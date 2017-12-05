class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    if params[:ingredient_id]
      recipe_ingredients_array = RecipeIngredient.where(ingredient_id: params[:ingredient_id]).to_a
      @recipes = []
      recipe_ingredients_array.each do |recipe_ingredient|
        recipe = Recipe.find(recipe_ingredient.recipe_id)
        @recipes << recipe
      end
      @recipes
    else
      @recipes = Recipe.all
    end
  end

  def show
    @ingredients = @recipe.ingredients.all
  end

  def new
    @recipe = Recipe.new
  end

  def edit
    if @recipe.user_id != current_user[:id]
      flash[:notice] = "You can only edit your own recipe"
      redirect_to recipes_path
    end
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def update
    #binding.pry
    @recipe.update(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
    if @recipe.user_id == current_user[:id]
      @recipe.destroy
      redirect_to recipes_path
    else
      redirect_to root_path
    end
  end

  private
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :user_id, :category_id, ingredient_ids: [],
                                   recipe_ingredients_attributes: [:id, :quantity, :key_ingredient, ingredient_attributes: [:id, :name]])
  end

end
