1//Params sent when creating recipe

"recipe"=>{
  "name"=>"Quantity Test",
  "description"=>"Trying to save quantity",
  "category_id"=>"3",
  "ingredients_attributes"=>{
    "0"=>{
      "name"=>"Eggs",
      "recipe_ingredients_attributes"=>{
        "0"=>{
          "quantity"=>"2",
          "key_ingredient"=>"0"
          }
        }
      },
    "1"=>{
      "name"=>"Chicken",
      "recipe_ingredients_attributes"=>{
        "0"=>{
          "quantity"=>"3 pieces",
          "key_ingredient"=>"0"
          }
        }
      }
    }
  }
}

Params are being sent but not saved, so iterate through recipe_params?

ingredients_attributes.each do |ingredient|
  =>     "0"=>{
            "name"=>"Eggs",
            "recipe_ingredients_attributes"=>{
              "0"=>{
                "quantity"=>"2",
                "key_ingredient"=>"0"
              }
            }
          }


2//Trying to debug why extra params are being sent when editing a recipe

"recipe"=>{
  "name"=>"Chocolate Milk",
  "description"=>"Warm milk in saucepan and slowly melt the chocolate, stirring constantly.",
  "category_id"=>"5",
  "ingredients_attributes"=>{
    "0"=>{
      "name"=>"Chocolate",
      "recipe_ingredients_attributes"=>{
        "0"=>{
          "quantity"=>"2 lbs",
          "key_ingredient"=>"1",
          "id"=>"149"}
          },
      "id"=>"48"},
    "1"=>{
      "name"=>"Milk",
      "recipe_ingredients_attributes"=>{
        "0"=>{
          "quantity"=>"3 Cups",
          "key_ingredient"=>"0",
          "id"=>"150"}},
      "id"=>"49"},
    "2"=>{
      "name"=>"",
      "recipe_ingredients_attributes"=>{
        "0"=>{
          "quantity"=>"",
          "key_ingredient"=>"0",
          "id"=>"151"},
        "1"=>{
          "quantity"=>"",
          "key_ingredient"=>"0",
          "id"=>"152"},
        "2"=>{
          "quantity"=>"",
          "key_ingredient"=>"0",
          "id"=>"153"},
        "3"=>{
          "quantity"=>"",
          "key_ingredient"=>"0",
          "id"=>"154"},
        "4"=>{
          "quantity"=>"",
          "key_ingredient"=>"0",
          "id"=>"155"}},
      "id"=>"50"},
    "3"=>{
      "name"=>"",
      "recipe_ingredients_attributes"=>{
        "0"=>{
          "quantity"=>"",
          "key_ingredient"=>"0",
          "id"=>"151"},
        "1"=>{
          "quantity"=>"",
          "key_ingredient"=>"0",
          "id"=>"152"},
        "2"=>{
          "quantity"=>"",
          "key_ingredient"=>"0",
          "id"=>"153"},
        "3"=>{
          "quantity"=>"",
          "key_ingredient"=>"0",
          "id"=>"154"},
        "4"=>{
          "quantity"=>"",
          "key_ingredient"=>"0",
          "id"=>"155"}},
        "id"=>"50"},
      "4"=>{
        "name"=>"",
        "recipe_ingredients_attributes"=>{
          "0"=>{
            "quantity"=>"",
            "key_ingredient"=>"0",
            "id"=>"151"},
          "1"=>{
            "quantity"=>"",
            "key_ingredient"=>"0",
            "id"=>"152"},
          "2"=>{
            "quantity"=>"",
            "key_ingredient"=>"0",
            "id"=>"153"},
          "3"=>{
            "quantity"=>"",
            "key_ingredient"=>"0",
            "id"=>"154"},
          "4"=>{
            "quantity"=>"",
            "key_ingredient"=>"0",
            "id"=>"155"}},
        "id"=>"50"},
      "5"=>{
        "name"=>"",
        "recipe_ingredients_attributes"=>{
          "0"=>{
            "quantity"=>"",
            "key_ingredient"=>"0",
            "id"=>"151"},
          "1"=>{
            "quantity"=>"",
            "key_ingredient"=>"0",
            "id"=>"152"},
          "2"=>{
            "quantity"=>"",
            "key_ingredient"=>"0",
            "id"=>"153"},
          "3"=>{
            "quantity"=>"",
            "key_ingredient"=>"0",
            "id"=>"154"},
          "4"=>{
            "quantity"=>"",
            "key_ingredient"=>"0",
            "id"=>"155"}},
        "id"=>"50"},
      "6"=>{
        "name"=>"",
        "recipe_ingredients_attributes"=>{
          "0"=>{
            "quantity"=>"",
            "key_ingredient"=>"0",
            "id"=>"151"},
          "1"=>{
            "quantity"=>"",
            "key_ingredient"=>"0",
            "id"=>"152"},
          "2"=>{
            "quantity"=>"",
            "key_ingredient"=>"0",
            "id"=>"153"},
          "3"=>{
            "quantity"=>"",
            "key_ingredient"=>"0",
            "id"=>"154"},
          "4"=>{
            "quantity"=>"",
            "key_ingredient"=>"0",
            "id"=>"155"}},
        "id"=>"50"}}}

When I create a recipe with 2/7 ingredients, it creates 5 blank ingredients with 5 blank recipe_ingredients forms for each
When I create a recipe with 6/7 ingredients, it creates 1 blank ingredient with 5 blank recipe_ingredients forms
--> Must be saving the blank ingredients and recipe_ingredients

3//Custom attribute writer is not working, have it working with a method right now

def save_recipe_ingredients(recipe_params)
  if recipe_params[:ingredients_attributes]
    recipe_params[:ingredients_attributes].each do |ingredient_attribute|
      if !recipe_params[:ingredients_attributes][ingredient_attribute][:name].blank? && !recipe_params[:ingredients_attributes][ingredient_attribute][:recipe_ingredients_attributes]["0"][:quantity].blank?
        ingredient_name = recipe_params[:ingredients_attributes][ingredient_attribute][:name].capitalize
        ingredient = Ingredient.find_or_create_by(name: ingredient_name)
        recipe_ingredient = RecipeIngredient.find_or_create_by(recipe_id: @recipe.id, ingredient_id: ingredient.id)
        recipe_ingredient.quantity = recipe_params[:ingredients_attributes][ingredient_attribute][:recipe_ingredients_attributes]["0"][:quantity]
        recipe_ingredient.key_ingredient = recipe_params[:ingredients_attributes][ingredient_attribute][:recipe_ingredients_attributes]["0"][:key_ingredient]
        recipe_ingredient.save
      end
    end
  end
end
