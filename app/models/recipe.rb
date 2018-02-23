class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  has_many :ratings

  validates :name, presence: true
  validates :description, presence: true

  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true, :reject_if => proc { |attribute| attribute[:quantity].blank? }

  has_attached_file :image, styles: { small: "64x64", medium: "100x100", large: "200x200" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def next
    #binding.pry
    recipe = self.class.where("id > ?", id).first
    recipe ? recipe : Recipe.first
  end
end
