$(document).ready(function() {
  bindClick();
})

function bindClick() {
  $('.all-recipes').on('click', function(e) {
    e.preventDefault();
    console.log('Home button was clicked!')
  })
}
