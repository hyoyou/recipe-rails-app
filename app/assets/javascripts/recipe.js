$(document).ready(function() {
  bindClickHandlerIndex();
  bindClickHandlerShow();
  bindClickHandlerNext();
  submitComment();
});

// Attach Click Event Handlers
function bindClickHandlerIndex() {
  $('.all-recipes').on('click', function(e) {
    e.preventDefault();

    history.pushState(null, null, '/recipes');

    $.get('/recipes.json', function(data) {
      // Clear out the container
      $('#recipes-container').html('');
      $('#recipes-container').html('<h1>Recipe Cards</h1>');
      data.forEach(function(recipe) {
        // Create recipe object
        var newRecipe = new Recipe(recipe.id, recipe.name, recipe.description, recipe.recipe_ingredients, recipe.category, recipe.image);
        // Apply prototype method
        var formattedIndex = newRecipe.formatIndex();
        // Append to the DOM
        $('#recipes-container').append(formattedIndex);
      });
    });
  });
}

function bindClickHandlerShow() {
  // Attach event listener to a parent to allow any current and future show_recipe classes to attach
  $(document).on('click', '.show_recipe', function(e) {
    e.preventDefault();

    let id = this.attributes["data-id"].value;
    history.pushState(null, null, `/recipes/${id}`);

    $.get(`/recipes/${id}.json`, function(recipe){
      // Clear out the container
      $('#recipes-container').html('');
      // Create recipe object
      let newRecipe = new Recipe(recipe.id, recipe.name, recipe.description, recipe.recipe_ingredients, recipe.category, recipe.image, recipe.comments);
      // Apply prototype method
      let formattedShow = newRecipe.formatShow();
      // Append to the DOM
      $('#recipes-container').append(formattedShow);
    });
  });
}

function bindClickHandlerNext() {
  $(document).on('click', '.next-recipe', function(e) {
    e.preventDefault();

    let id = parseInt(this.attributes["data-id"].value);
    history.pushState(null, null, `/recipes/${id}`);

    $.get(`/recipes/${id}/next`, function(recipe){
      // Clear out the container
      $('#recipes-container').html('');
      // Create recipe object
      let newRecipe = new Recipe(recipe.id, recipe.name, recipe.description, recipe.recipe_ingredients, recipe.category, recipe.image, recipe.comments);
      // Apply prototype method
      let formattedShow = newRecipe.formatShow();
      // Append to the DOM
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

// Object Constructor Function
function Recipe(id, name, description, recipe_ingredients, category, image, comments) {
  this.id = id;
  this.name = name;
  this.description = description;
  this.recipe_ingredients = recipe_ingredients;
  this.category = category;
  this.image = image;
  this.comments = comments;
}

// Prototype Methods
Recipe.prototype.formatIndex = function() {
  let recipeHtml = '';

  recipeHtml += `<h3><a href=/recipes/${this.id} + data-id=${this.id} + class=show_recipe>` + this.name + `</a></h3>`;

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
