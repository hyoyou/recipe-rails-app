class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :update, :show, :destroy]

  def index
    if params[:ingredient_id]
      recipe_ingredients_array = RecipeIngredient.where(ingredient_id: params[:ingredient_id]).to_a
      @recipes = []
      recipe_ingredients_array.each do |recipe_ingredient|
        recipe = Recipe.find(recipe_ingredient.recipe_id)
        @recipes << recipe
      end
      @recipe
    else
      @recipes = Recipe.all
    end
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
      save_recipe_ingredients(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def update
    @recipe.update(recipe_params)
    if @recipe.save
      save_recipe_ingredients(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def show
    @ingredients = @recipe.ingredients.all
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
    params.require(:recipe).permit(:name,
                                   :description,
                                   :user_id,
                                   :category_id,
                                   ingredients_ids: [],
                                   ingredients_attributes: [:name, recipe_ingredients_attributes: [:quantity, :key_ingredient]])
  end

  def save_recipe_ingredients(recipe_params)
    if recipe_params[:ingredients_attributes]
      recipe_params[:ingredients_attributes].each do |ingredient_attribute|
        if !recipe_params[:ingredients_attributes][ingredient_attribute][:name].blank? && !recipe_params[:ingredients_attributes][ingredient_attribute][:recipe_ingredients_attributes]["0"][:quantity].blank?
          ingredient_name = recipe_params[:ingredients_attributes][ingredient_attribute][:name].capitalize
          ingredient = Ingredient.find_or_create_by(name: ingredient_name)
          recipe_ingredient = RecipeIngredient.find_or_create_by(recipe_id: @recipe.id, ingredient_id: ingredient.id)
          recipe_ingredient.quantity = recipe_params[:ingredients_attributes][ingredient_attribute][:recipe_ingredients_attributes]["0"][:quantity]
          recipe_ingredient.key_ingredient = recipe_params[:ingredients_attributes][ingredient_attribute][:recipe_ingredients_attributes]["0"][:key_ingredient]
          recipe_ingredient.save
        end
      end
    end
  end

end
