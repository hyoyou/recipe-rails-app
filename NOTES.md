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



@recipe = current_user.recipes.build(name: params[:recipe][:name], description: params[:recipe][:description], category_id: params[:recipe][:category_id])
if @recipe.save
  save_recipe_ingredients(recipe_params)
  redirect_to recipe_path(@recipe)
else
  render :new
end

<% 7.times do %>
  <%= f.fields_for :ingredients, @recipe.ingredients.build do |ingredients_fields| %>
    <%= ingredients_fields.text_field :name, :placeholder => "Name" %>

    <%= ingredients_fields.fields_for :recipe_ingredients, @recipe.recipe_ingredients.build do |recipe_ingredients_fields| %>
      <%= recipe_ingredients_fields.text_field :quantity, :placeholder => "Quantity, Ex: '1 tbsp'" %>
      <%= recipe_ingredients_fields.check_box :key_ingredient %>
      <%= recipe_ingredients_fields.label :key_ingredient %><br>
    <% end %>
  <% end %>
<% end %>
