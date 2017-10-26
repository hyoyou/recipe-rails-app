class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :ratings

  validates :name, :description, presence: true

  accepts_nested_attributes_for :ingredients
  
end
