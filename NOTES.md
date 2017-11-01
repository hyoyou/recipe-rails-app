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
