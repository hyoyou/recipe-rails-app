$(document).ready(function() {
  attachEventListeners();
});

function attachEventListeners() {
  $('.all-recipes').on('click', function(e) {
    e.preventDefault();
    history.pushState(null, null, 'recipes');
    $.get('/recipes.json', function(data) {
      //console.log(data);
      $('#recipes-container').html('');
      data.forEach(function(recipe) {
        //console.log(recipe)
        //debugger
        var newRecipe = new Recipe(recipe.id, recipe.name, recipe.description, recipe.recipe_ingredients, recipe.category);
        var formattedIndex = newRecipe.formatIndex();
        //console.log(formattedRecipe)
        $('#recipes-container').append(formattedIndex);
      });
    });

    // attach event listener to a parent to allow any current and future show_recipe classes attach
    $(document).on('click', '.show_recipe', function(e) {
      e.preventDefault();
      alert('click');
      //$.get(`/recipes/${this.id}`)
    });
  });
}

function Recipe(id, name, description, recipe_ingredients, category) {
  this.id = id;
  this.name = name;
  this.description = description;
  this.recipe_ingredients = recipe_ingredients;
  this.category = category;
}

Recipe.prototype.formatIndex = function() {
  let recipeHtml = '';
  //debugger
  recipeHtml += `<h3><a href=/recipes/${this.id} + data-id=${this.id} + class=show_recipe>` + this.name + `</a></h3>`;
  //move out to separate function?
  //debugger
  let rcp_ing = this.recipe_ingredients;

  function findKeyIngredient(rcp_ing) {
    var key_ing = "";
    rcp_ing.forEach(function(ingredient) {
      if (ingredient.key_ingredient === true) {
        //debugger
        key_ing += ingredient.ingredient.name;
      }
      //debugger
    });
    //debugger
    return key_ing;
  }
  var key_ingredient = findKeyIngredient(rcp_ing);

  //debugger
  recipeHtml += '<p><strong>Key Ingredient: </strong>' + key_ingredient + '</p>';
  recipeHtml += '<p><strong>Category: </strong>' + this.category.name + '</p>';

  return recipeHtml;
};


Recipe.prototype.formatShow = function() {

};
