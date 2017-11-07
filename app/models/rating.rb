class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :rating, :inclusion => 1..5
  
end
