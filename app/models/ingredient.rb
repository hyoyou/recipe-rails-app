class Ingredient < ApplicationRecord
  has_many :recipe_ingredients, dependent: :destroy
  has_many :recipes, through: :recipe_ingredients

  validates :name, uniqueness: true, presence: true

  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true

  #def recipe_ingredients_attributes=(recipe_ingredients_attributes)
  #  recipe_ingredients_attributes.values.each do |recipe_ingredient_attribute|
  #    if !recipe_ingredient_attribute.blank?
  #      recipe_ingredient = RecipeIngredient.find_or_create_by(quantity: recipe_ingredient_attribute[:quantity], key_ingredient: recipe_ingredient_attribute[:key_ingredient])
  #      self.recipe_ingredients << recipe_ingredient
  #    end
  #  end
  #end

end
