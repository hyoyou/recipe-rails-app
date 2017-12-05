# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(name: "Appetizer")
Category.create(name: "Main Dish")
Category.create(name: "Side Dish")
Category.create(name: "Soup")
Category.create(name: "Salad")
Category.create(name: "Dessert")
Category.create(name: "Beverage")


Recipe.create(name: "Chicken Tenders",
              description: "Preheat oven to 375F.
              Season the chicken tenders with salt and black pepper.
              In a shallow dish, season the flour with salt and black pepper then beat the eggs in another shallow dish with the milk.
              In a third shallow dish, place the breadcrumbs.
              Dredge the chicken tenders in the flour to coat, shaking off any excess flour.
              Dip the floured chicken tenders into the egg and finally, coat the chicken tenders with the breadcrumbs.
              Place the breaded chicken tenders onto a baking sheet and bake in the oven for 12-15 minutes, until golden brown.",
              user_id: 1,
              category_id: 1)
Recipe.create(name: "Fettuccine Alfredo",
              description: "Bring a large pot of lightly salted water to a boil.
              Add fettuccini and cook for 8 to 10 minutes or until al dente; drain.
              In a large saucepan, melt butter into cream over low heat.
              Add salt, pepper and garlic salt.
              Stir in cheese over medium heat until melted; this will thicken the sauce.
              Add pasta to sauce.
              Use enough of the pasta so that all of the sauce is used and the pasta is thoroughly coated.
              Serve immediately.",
              user_id: 1,
              category_id: 2)
Recipe.create(name: "Bacon-Cheddar Waffles",
              description: "Preheat oven to 200°.
              Cook bacon in a large skillet over medium-high heat until crisp and brown, 8 minutes.
              Transfer to a paper towel-lined plate to let drain, then chop.
              Pour out all but 1 tablespoon bacon grease from pan.
              In a small bowl, whisk together flour, baking soda, and baking powder, and season with salt and pepper.
              In a medium bowl, whisk together 1 egg, buttermilk, and 1 tablespoon butter.
              Add dry ingredients to wet ingredients, whisking until smooth.
              Add bacon, cheddar, and almost all scallions to batter, leaving some for garnish.
              Heat a waffle maker and brush with melted butter.
              Cook waffles in batches until golden.
              Heat skillet (with bacon grease) over medium-high heat and cook remaining 4 eggs until whites are set and yolks are still soft.
              Season with salt and pepper.
              Serve waffles with an egg on top and garnish with remaining scallions.",
              user_id: 1,
              category_id: 2)


Ingredient.create(name: "Chicken")
Ingredient.create(name: "Flour")
Ingredient.create(name: "Bread crumbs")
Ingredient.create(name: "Egg")
Ingredient.create(name: "Milk")
Ingredient.create(name: "Salt")
Ingredient.create(name: "Pepper")
Ingredient.create(name: "Fettucine")
Ingredient.create(name: "Butter")
Ingredient.create(name: "Heavy cream")
Ingredient.create(name: "Salt")
Ingredient.create(name: "Pepper")
Ingredient.create(name: "Parmesan cheese")
Ingredient.create(name: "Bacon")
Ingredient.create(name: "Baking soda")
Ingredient.create(name: "Baking powder")
Ingredient.create(name: "Buttermilk")
Ingredient.create(name: "Cheddar")
Ingredient.create(name: "Green onion")


RecipeIngredient.create(recipe_id: 1, ingredient_id: 1, quantity: "2 1/4 lbs", key_ingredient: true)
RecipeIngredient.create(recipe_id: 1, ingredient_id: 2, quantity: "1 1/2 Cups", key_ingredient: false)
RecipeIngredient.create(recipe_id: 1, ingredient_id: 3, quantity: "2 Cups", key_ingredient: false)
RecipeIngredient.create(recipe_id: 1, ingredient_id: 4, quantity: "2", key_ingredient: false)
RecipeIngredient.create(recipe_id: 1, ingredient_id: 5, quantity: "1/4 Cup", key_ingredient: false)
RecipeIngredient.create(recipe_id: 1, ingredient_id: 6, quantity: "To taste", key_ingredient: false)
RecipeIngredient.create(recipe_id: 1, ingredient_id: 7, quantity: "To taste", key_ingredient: false)
RecipeIngredient.create(recipe_id: 2, ingredient_id: 8, quantity: "1 Box", key_ingredient: true)
RecipeIngredient.create(recipe_id: 2, ingredient_id: 9, quantity: "1 Cup", key_ingredient: false)
RecipeIngredient.create(recipe_id: 2, ingredient_id: 10, quantity: "3/4 Pint", key_ingredient: false)
RecipeIngredient.create(recipe_id: 2, ingredient_id: 11, quantity: "1 tsp", key_ingredient: false)
RecipeIngredient.create(recipe_id: 2, ingredient_id: 12, quantity: "1 tsp", key_ingredient: false)
RecipeIngredient.create(recipe_id: 2, ingredient_id: 13, quantity: "1/2 Cup", key_ingredient: false)
RecipeIngredient.create(recipe_id: 3, ingredient_id: 14, quantity: "4 Slices", key_ingredient: true)
RecipeIngredient.create(recipe_id: 3, ingredient_id: 2, quantity: "1 Cup", key_ingredient: false)
RecipeIngredient.create(recipe_id: 3, ingredient_id: 15, quantity: "1/4 tsp", key_ingredient: false)
RecipeIngredient.create(recipe_id: 3, ingredient_id: 16, quantity: "1 1/4 tsp", key_ingredient: false)
RecipeIngredient.create(recipe_id: 3, ingredient_id: 4, quantity: "5", key_ingredient: false)
RecipeIngredient.create(recipe_id: 3, ingredient_id: 17, quantity: "1 Cup", key_ingredient: false)
RecipeIngredient.create(recipe_id: 3, ingredient_id: 9, quantity: "3 T", key_ingredient: false)
RecipeIngredient.create(recipe_id: 3, ingredient_id: 18, quantity: "3/4 Cup", key_ingredient: true)
RecipeIngredient.create(recipe_id: 3, ingredient_id: 19, quantity: "3", key_ingredient: false)
RecipeIngredient.create(recipe_id: 3, ingredient_id: 6, quantity: "To taste", key_ingredient: false)
RecipeIngredient.create(recipe_id: 3, ingredient_id: 7, quantity: "To taste", key_ingredient: false)


User.create(email: "heather@heatheryou.com", password: '12345678', admin: true)
