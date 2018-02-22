$(document).ready(function() {
  attachEventListeners();
})

function attachEventListeners() {
  $('.all-recipes').on('click', function(e) {
    e.preventDefault();

    $.get('/recipes.json', function(data) {
      console.log(data);
    })
  })
}
