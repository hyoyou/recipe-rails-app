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
                        user_id: 2)

user = User.create(email: "heather@heatheryou.com", password: '12345678')
