module RecipesHelper

  def find_key_ingredients(recipe)
    key_ingredient_array = RecipeIngredient.where(recipe_id: recipe.id, key_ingredient: true).to_a
    html = ''
    key_ingredient_array.map do |k|
      ingredient = Ingredient.find(k.ingredient_id)
      html += link_to(ingredient.name, ingredient_recipes_path(ingredient), :recipe_id => recipe.id)
    end
    html.html_safe
  end
  
end
