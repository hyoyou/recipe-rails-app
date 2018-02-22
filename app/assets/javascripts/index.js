$(document).ready(function() {
  attachEventListeners();
})

function attachEventListeners() {
  $('.all-recipes').on('click', function(e) {
    e.preventDefault();

    $.get('/recipes.json', function(data) {
      //console.log(data);
      data.forEach(function(recipe) {
        //console.log(recipe.id)
        var newRecipe = new Recipe(recipe.id, recipe.name, recipe.description);
        var formattedRecipe = newRecipe.formatRecipe();
        $('.recipe-container').html('');
        console.log(formattedRecipe)
        //$('.recipe-container').append(formattedRecipe);
      })
    })
  })
}

function Recipe(id, name, description) {
  this.id = id;
  this.name = name;
  this.description = description
}

Recipe.prototype.formatRecipe = function() {
  let recipeHtml = ''
  recipeHtml += '<h1>' + this.name + '</h1>';
  recipeHtml += '<p>' + this.description + '</p>';

  return recipeHtml;
}
