class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy, :next]

  def home
    if current_user
      redirect_to recipes_path
    else
      render :home
    end
  end

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
      respond_to do |f|
        f.html
        f.json { render json: @recipes }
      end
    end
  end

  def show
    @comments = @recipe.comments
    @comment = @recipe.comments.build
    respond_to do |f|
      f.html
      f.json { render json: @recipe }
    end
  end

  def new
    @recipe = Recipe.new
    10.times { @recipe.recipe_ingredients.build.build_ingredient }
  end

  def edit
    10.times { @recipe.recipe_ingredients.build.build_ingredient }
    if @recipe.user_id != current_user[:id]
      flash[:notice] = "You can only edit your own recipe"
      redirect_to recipes_path
    end
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      flash[:notice] = "Thank you for adding a new recipe!"
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def update
    @recipe.update(recipe_params)
    if @recipe.save
      flash[:notice] = "Your recipe has been updated."
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
    if @recipe.user_id == current_user[:id]
      @recipe.destroy
      flash[:notice] = "Your recipe has been deleted."
      redirect_to recipes_path
    else
      redirect_to root_path
    end
  end

  def next
    @next_recipe = @recipe.next
    render json: @next_recipe
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:name, :description, :user_id, :category_id, :image, ingredient_ids: [],
                                     recipe_ingredients_attributes: [:id, :quantity, :key_ingredient, ingredient_attributes: [:id, :name]])
    end

end
