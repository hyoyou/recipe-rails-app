# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

recipe1 = Recipe.create(name: "Fettuccine Alfredo",
                        description: "Bring a large pot of lightly salted water to a boil.
                        Add fettuccini and cook for 8 to 10 minutes or until al dente; drain.
                        In a large saucepan, melt butter into cream over low heat.
                        Add salt, pepper and garlic salt.
                        Stir in cheese over medium heat until melted; this will thicken the sauce.
                        Add pasta to sauce.
                        Use enough of the pasta so that all of the sauce is used and the pasta is thoroughly coated.
                        Serve immediately.",
                        user_id: 2,
                        category_id: 2)

ingredient1 = Ingredient.create(name: "Fettucine")
ingredient2 = Ingredient.create(name: "Butter")
ingredient3 = Ingredient.create(name: "Heavy Cream")
ingredient4 = Ingredient.create(name: "Salt")
ingredient5 = Ingredient.create(name: "Pepper")
ingredient6 = Ingredient.create(name: "Parmesan Cheese")

recipe_ingredient1 = RecipeIngredient.create(recipe_id: 18, ingredient_id: 22, quantity: "1 Box", key_ingredient: true)
recipe_ingredient1 = RecipeIngredient.create(recipe_id: 18, ingredient_id: 23, quantity: "1 Cup", key_ingredient: false)
recipe_ingredient1 = RecipeIngredient.create(recipe_id: 18, ingredient_id: 24, quantity: "3/4 Pint", key_ingredient: false)
recipe_ingredient1 = RecipeIngredient.create(recipe_id: 18, ingredient_id: 25, quantity: "1 tsp", key_ingredient: false)
recipe_ingredient1 = RecipeIngredient.create(recipe_id: 18, ingredient_id: 26, quantity: "1 tsp", key_ingredient: false)
recipe_ingredient1 = RecipeIngredient.create(recipe_id: 18, ingredient_id: 27, quantity: "1/2 Cup", key_ingredient: false)

user = User.create(email: "heather@heatheryou.com", password: '12345678')
