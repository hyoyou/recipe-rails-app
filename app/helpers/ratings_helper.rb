module RatingsHelper
  
  def ratings_average(recipe)
    ratings_array = []
    recipe.ratings.each do |rating|
      ratings_array << rating.rating
    end
    ratings_array.inject{ |sum, el| sum + el }.to_f / ratings_array.size
  end

  def rate_recipe(recipe)
    if current_user.ratings.find_by(recipe_id: recipe.id) != nil
      "You rated this recipe: #{user_rating(recipe)}"
    else
      link_to "Rate this Recipe", new_recipe_rating_path(recipe)
    end
  end

  def user_rating(recipe)
    r = current_user.ratings.find_by(recipe_id: recipe.id)
    r.rating
  end

end
