class RecipeIngredientSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :key_ingredient, :ingredient

  belongs_to :ingredient
end
