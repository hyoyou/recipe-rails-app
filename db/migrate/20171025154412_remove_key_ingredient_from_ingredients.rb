class RemoveKeyIngredientFromIngredients < ActiveRecord::Migration[5.1]
  def change
    remove_column :ingredients, :key_ingredient, :boolean
  end
end
