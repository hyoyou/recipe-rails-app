class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :user_id, :category_id

  has_many :recipe_ingredients
  has_many :ratings
end
