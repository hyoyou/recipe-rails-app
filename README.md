# Recipe Rails/JavaScript Application

This is a Rails Application with jQuery Front End that I created for my JavaScript Final Project at Learn//Flatiron School. <hr />
It is a simple recipe management application using Ruby on Rails for back-end and jQuery for front-end. Users can view recipes on the homepage or they can filter it by category. Sometimes when we follow recipes, we end up buying some ingredient specifically for the purpose of using it for this one recipe and don't know what to do with the leftovers. I wanted to try eliminating this problem by adding a key ingredient attribute, where each recipe contains at least one key ingredient, the highlight of the recipe. On each recipe page, I give users to search for other recipes using the same key ingredient. Users who are signed up and signed in are also given the option to add a new recipe as well as give ratings for other recipes. Quick view recipes eliminate ratings and comments to show only ingredients and directions. These pages are rendered using Ajax.

## Usage

After cloning the repo, run `bundle install` to install dependencies. To migrate your local database, run `rake db:migrate`. Also, you may run `rake db:seed` to seed the database if you would like. To start the application on your machine, run `rails s`. In a browser, go to http://localhost:3000/ to begin (Note: you may be using a different port. Please update accordingly).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hyoyou/recipe-rails-app. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The project is available as open source under the terms of the [MIT License](https://github.com/hyoyou/recipe-rails-app/blob/master/LICENSE).
