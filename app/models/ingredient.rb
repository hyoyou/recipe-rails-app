class Ingredient < ApplicationRecord
  has_many :recipe_ingredients, dependent: :destroy
  has_many :recipes, through: :recipe_ingredients

  validates :name, uniqueness: true, presence: true, format: { with: /[a-zA-Z]/ }

end
