class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :user_id

  has_many :recipe_ingredients
  belongs_to :category
  has_many :ratings
end
