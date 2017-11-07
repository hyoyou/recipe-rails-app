class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :rating, :inclusion => 1..5
  validates :recipe_id, uniqueness: { scope: :user_id, message: "You have already rated this recipe." }

end
