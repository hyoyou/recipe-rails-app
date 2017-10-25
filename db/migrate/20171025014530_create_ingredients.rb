class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :quantity
      t.boolean :key_ingredient, default: false

      t.timestamps
    end
  end
end
