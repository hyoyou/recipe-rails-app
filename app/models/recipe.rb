class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  has_many :ratings

  validates :name, :description, presence: true

  #accepts_nested_attributes_for :ingredients, reject_if: :reject_ingredients
  #accepts_nested_attributes_for :recipe_ingredients

  #def reject_ingredients(ingredients_attributes)
  #  ingredients_attributes.values.each do |ingredient_attribute|
  #    ingredient_attribute == ""
  #  end
  #end

  #"ingredients_attributes"=>{"0"=>{"name"=>"Fettucine"}, "1"=>{"name"=>"Heavy Cream"}, "2"=>{"name"=>"Parmesan Cheese"}}
  def ingredients_attributes=(ingredients_attributes)
    ingredients_attributes.values.each do |ingredient_attribute|
      if !ingredient_attribute == ""
        ingredient = Ingredient.find_or_create_by(name: ingredient_attribute[:name])
        self.ingredients << ingredient
      end
    end
  end

end
