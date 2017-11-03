module RecipesHelper
  def save_recipe_ingredients(recipe_params)
    if recipe_params[:ingredients_attributes]
      recipe_params[:ingredients_attributes].each do |ingredient_attribute|
        if !recipe_params[:ingredients_attributes][ingredient_attribute][:name].blank?
          ingredient = Ingredient.find_or_create_by(name: recipe_params[:ingredients_attributes][ingredient_attribute][:name])
          recipe_ingredient = RecipeIngredient.find_or_create_by(recipe_id: @recipe.id, ingredient_id: ingredient.id)
          recipe_ingredient.quantity = recipe_params[:ingredients_attributes][ingredient_attribute][:recipe_ingredients_attributes]["0"][:quantity]
          recipe_ingredient.key_ingredient = recipe_params[:ingredients_attributes][ingredient_attribute][:recipe_ingredients_attributes]["0"][:key_ingredient]
          recipe_ingredient.save
        end
      end
    end
  end
end
