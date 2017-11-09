class Ingredient < ApplicationRecord
  has_many :recipe_ingredients, dependent: :destroy
  has_many :recipes, through: :recipe_ingredients

  validates :name, uniqueness: true, presence: true

  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true
end
