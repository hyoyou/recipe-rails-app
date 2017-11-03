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

Ingredient.create(name: "Fettucine")
Ingredient.create(name: "Butter")
Ingredient.create(name: "Heavy Cream")
Ingredient.create(name: "Salt")
Ingredient.create(name: "Pepper")
Ingredient.create(name: "Parmesan Cheese")

RecipeIngredient.create(recipe_id: 1, ingredient_id: 1, quantity: "1 Box", key_ingredient: true)
RecipeIngredient.create(recipe_id: 1, ingredient_id: 2, quantity: "1 Cup", key_ingredient: false)
RecipeIngredient.create(recipe_id: 1, ingredient_id: 3, quantity: "3/4 Pint", key_ingredient: false)
RecipeIngredient.create(recipe_id: 1, ingredient_id: 4, quantity: "1 tsp", key_ingredient: false)
RecipeIngredient.create(recipe_id: 1, ingredient_id: 5, quantity: "1 tsp", key_ingredient: false)
RecipeIngredient.create(recipe_id: 1, ingredient_id: 6, quantity: "1/2 Cup", key_ingredient: false)

User.create(email: "heather@heatheryou.com", password: '12345678')
