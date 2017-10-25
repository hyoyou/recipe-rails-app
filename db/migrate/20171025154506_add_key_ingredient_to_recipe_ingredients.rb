class AddKeyIngredientToRecipeIngredients < ActiveRecord::Migration[5.1]
  def change
    add_column :recipe_ingredients, :key_ingredient, :boolean, default: false
  end
end
