(function(w, $){
  
  // Toggle contact
  var $nav = $('.pagenav');
  $nav.on('click', '.contact-toggle', function(e) {
    e.preventDefault();
    $('.contact.dropdown', $nav).toggleClass('active');
  });

})(this, jQuery);
