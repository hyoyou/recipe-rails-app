class RecipeIngredientSerializer < ActiveModel::Serializer
  attributes :id, :ingredient_id, :quantity, :key_ingredient

  belongs_to :ingredient
end
