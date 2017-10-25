class RemoveQuantityFromIngredients < ActiveRecord::Migration[5.1]
  def change
    remove_column :ingredients, :quantity, :string
  end
end
