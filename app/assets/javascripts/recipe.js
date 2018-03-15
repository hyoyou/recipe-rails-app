$(document).ready(function() {
  attachEventListeners();
  submitComment();
});

function attachEventListeners() {
  $('.all-recipes').on('click', function(e) {
    e.preventDefault();
    history.pushState(null, null, '/recipes');
    $.get('/recipes.json', function(data) {

      $('#recipes-container').html('');
      data.forEach(function(recipe) {

        var newRecipe = new Recipe(recipe.id, recipe.name, recipe.description, recipe.recipe_ingredients, recipe.category, recipe.image);
        var formattedIndex = newRecipe.formatIndex();

        $('#recipes-container').append(formattedIndex);
      });
    });
  });

  // attach event listener to a parent to allow any current and future show_recipe classes attach
  $(document).on('click', '.show_recipe', function(e) {
    e.preventDefault();
    let id = this.attributes["data-id"].value;
    history.pushState(null, null, `/recipes/${id}`);
    $.get(`/recipes/${id}.json`, function(recipe){
      $('#recipes-container').html('');
      let newRecipe = new Recipe(recipe.id, recipe.name, recipe.description, recipe.recipe_ingredients, recipe.category, recipe.image, recipe.comments);
      let formattedShow = newRecipe.formatShow();

      $('#recipes-container').append(formattedShow);
    });
  });


  $(document).on('click', '.next-recipe', function(e) {
    e.preventDefault();
    let id = parseInt(this.attributes["data-id"].value);
    history.pushState(null, null, `/recipes/${id}`);
    $.get(`/recipes/${id}/next`, function(recipe){

      $('#recipes-container').html('');
      let newRecipe = new Recipe(recipe.id, recipe.name, recipe.description, recipe.recipe_ingredients, recipe.category, recipe.image, recipe.comments);
      let formattedShow = newRecipe.formatShow();

      $('#recipes-container').append(formattedShow);
    });
  });
}

function submitComment() {
  $("#new_comment").on("submit", function(e) {
    e.preventDefault();

    $.ajax({
      type: ($("input[name='_method']").val() || this.method),
      url: this.action,
      data: $(this).serialize(),
      success: function(response){
        alert('Thank you for your comment!');
        $("#comment_body").val("");
        $("div.comments ol").append(`<li>` + response + `</li>`);
        $("#new_comment").remove();
      },
      error: function (response) {
        console.log(response);
      }
    });
  });
}

function Recipe(id, name, description, recipe_ingredients, category, image, comments) {
  this.id = id;
  this.name = name;
  this.description = description;
  this.recipe_ingredients = recipe_ingredients;
  this.category = category;
  this.image = image;
  this.comments = comments;
}

Recipe.prototype.formatIndex = function() {
  let recipeHtml = '';

  recipeHtml += `<div class="column"><h3><a href=/recipes/${this.id} + data-id=${this.id} + class=show_recipe>` + this.name + `</a></h3></div>`;

  //move out to separate function?
  //let rcp_ing = this.recipe_ingredients;
//
  //function findKeyIngredient(rcp_ing) {
  //  var key_ing = "";
  //  rcp_ing.forEach(function(ingredient) {
  //    if (ingredient.key_ingredient === true) {
  //      key_ing += ingredient.ingredient.name;
  //    }
  //  });
  //  return key_ing;
  //}
  //var key_ingredient = findKeyIngredient(rcp_ing);
//
  //recipeHtml += '<p><strong>Key Ingredient: </strong>' + key_ingredient + '</p>';
  //recipeHtml += '<p><strong>Category: </strong>' + this.category.name + '</p>';

  return recipeHtml;
};


Recipe.prototype.formatShow = function() {
  var recipeHtml = '';
  recipeHtml += `<button data-id=${this.id} class="next-recipe">Next Recipe</button>`;

  recipeHtml += `<h1>` + this.name + `</h1>`;
  recipeHtml += `<img src="` + this.image + `" style="float: right; width:250px; padding: 0px 20px 0px 10px;">`;
  recipeHtml += `<p>` + this.description + `</p>`;
  recipeHtml += `<p><strong>Category: </strong>` + this.category.name + `</p>`;

  recipeHtml += `<table><tr><th>Name</th><th>Quantity</th>`;
  var rIngredients = this.recipe_ingredients;
  for (var i=0; i < rIngredients.length; i++) {
    recipeHtml += `<tr><td>${rIngredients[i].ingredient.name}</td>`;
    recipeHtml += `<td>${rIngredients[i].quantity}</td></tr>`;
  }
  recipeHtml += `</table>`;
  return recipeHtml;
};
