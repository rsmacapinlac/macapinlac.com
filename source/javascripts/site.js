// This is where it all goes :)

// Card click handling
document.addEventListener('DOMContentLoaded', function() {
  var cards = document.querySelectorAll('.card[data-url]');
  
  for (var i = 0; i < cards.length; i++) {
    var card = cards[i];
    card.addEventListener('click', function(e) {
      // Don't trigger card click if clicking on a tag link
      if (e.target.closest('.card-tag')) {
        return;
      }
      
      // Navigate to the post URL
      var url = this.getAttribute('data-url');
      if (url) {
        window.location.href = url;
      }
    });
  }
});
