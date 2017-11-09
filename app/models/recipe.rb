class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  has_many :ratings

  validates :name, presence: true
  validates :description, presence: true

  accepts_nested_attributes_for :ingredients, reject_if: :reject_ingredients

  def reject_ingredients(ingredients_attributes)
    ingredients_attributes.values.each do |ingredient_attribute|
      ingredient_attribute == ""
    end
  end

end
