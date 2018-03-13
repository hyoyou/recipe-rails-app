$(document).ready(function() {
  attachEventListeners();
});

function attachEventListeners() {
  $('.all-recipes').on('click', function(e) {
    e.preventDefault();
    history.pushState(null, null, '/recipes');
    $.get('/recipes.json', function(data) {
      //console.log(data);
      $('#recipes-container').html('');
      data.forEach(function(recipe) {
        //console.log(recipe)
        //debugger
        var newRecipe = new Recipe(recipe.id, recipe.name, recipe.description, recipe.recipe_ingredients, recipe.category, recipe.image);
        var formattedIndex = newRecipe.formatIndex();
        //console.log(formattedRecipe)
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
      //console.log(recipe);
      //debugger
      $('#recipes-container').html('');
      let newRecipe = new Recipe(recipe.id, recipe.name, recipe.description, recipe.recipe_ingredients, recipe.category, recipe.image, recipe.comments);
      let formattedShow = newRecipe.formatShow();
      //debugger
      $('#recipes-container').append(formattedShow);
    });
  });


  $(document).on('click', '.next-recipe', function(e) {
    e.preventDefault();
    //debugger
    let id = parseInt(this.attributes["data-id"].value);
    history.pushState(null, null, `/recipes/${id + 1}/next`);
    $.get(`/recipes/${id}/next`, function(recipe){
      //console.log(recipe);
      //debugger
      $('#recipes-container').html('');
      let newRecipe = new Recipe(recipe.id, recipe.name, recipe.description, recipe.recipe_ingredients, recipe.category, recipe.image, recipe.comments);
      let formattedShow = newRecipe.formatShow();
      //debugger
      $('#recipes-container').append(formattedShow);
    });
  });

  $("#new_comment").on("submit", function(e) {
    e.preventDefault();
    $.ajax({
      type: ($("input[name='_method']").val() || this.method),
      //'post'
      url: this.action,
      data: $(this).serialize(),
      success: function(response){
        //console.log(response);
        alert('Thank you for your comment!');
        $("#comment_body").val("");
        $("div.comments ol").append(`<li>` + response + `</li>`);
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
  var recipeHtml = '';
  //debugger
  recipeHtml += `<button data-id=${this.id} class="next-recipe">Next Recipe</button>`;

  recipeHtml += `<h1>` + this.name + `</h1>`;
  //debugger
  recipeHtml += `<img src="` + this.image + `">`;
  recipeHtml += `<p>` + this.description + `</p>`;
  recipeHtml += `<p><strong>Category: </strong>` + this.category.name + `</p>`;

  recipeHtml += `<table><tr><th>Name</th><th>Quantity</th>`;
  var rIngredients = this.recipe_ingredients;
  for (var i=0; i < rIngredients.length; i++) {
    //console.log(rIngredients[i]);
    recipeHtml += `<tr><td>${rIngredients[i].ingredient.name}</td>`;
    recipeHtml += `<td>${rIngredients[i].quantity}</td></tr>`;
  }
  recipeHtml += `</table>`;
  recipeHtml += `<h3>Comments for this Recipe:</h3>`;
  recipeHtml += `<form class="new_comment" id="new_comment" action="/recipes/${this.id}/comments" method="post">
                <input type="hidden" name="authenticity_token" value="Qb6Bk4rwHnvLFF4GohnwME9krJ4lerevU4VDT3sjNzdKlNhtk3Tw2UT9JWxEWNK44OFjY7NveaWsrBZy1GWBkw==">
                <textarea name="comment[body]" id="comment_body"></textarea>
                <p><input type="submit" value="Create Comment"></p>
                </form>`;
  return recipeHtml;
};

//<ActionController::Parameters {"utf8"=>"✓", "authenticity_token"=>"Qb6Bk4rwHnvLFF4GohnwME9krJ4lerevU4VDT3sjNzdKlNhtk3Tw2UT9JWxEWNK44OFjY7NveaWsrBZy1GWBkw==", "comment"=><ActionController::Parameters {"body"=>"testt"} permitted: false>, "controller"=>"comments", "action"=>"create", "recipe_id"=>"1"} permitted: false>
