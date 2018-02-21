class RecipeIngredientSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :key_ingredient

  belongs_to :ingredient
end
