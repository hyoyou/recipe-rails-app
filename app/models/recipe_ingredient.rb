class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient, optional: true

  def ingredient_attributes=(ingredient_attributes)
    ingredient_attributes.each do |index, ingredient_attribute|
      if ingredient_attribute.is_a?(Hash) && !ingredient_attribute[:name].blank?
        ingredient = Ingredient.find_by(name: ingredient_attribute[:name])
        self.ingredient = ingredient
      elsif ingredient_attribute.is_a?(String) && !ingredient_attribute.blank?
        ingredient_name = ingredient_attribute.capitalize
        ingredient = Ingredient.find_or_create_by(name: ingredient_name)
        self.ingredient = ingredient
      end
    end
  end

end
