(function(w, $) {

	// Toggle contact
	var $nav = $('.pagenav');
	$nav.on('click', '.contact-toggle', function(e) {
		e.preventDefault();
		$('.contact.dropdown', $nav).toggleClass('active');
	});

	$(function() {
		if (location.hash === '#contact') {
			$('#contactForm').validate({
				debug: true,
				rules: {
					name: {
						required: true
					},
					body: {
						required: true
					},
					email: {
						required: true,
						email: true
					}
				}
			});
		}
	});


	//Waypoints for sticky meta
	$(function() {
		var $el = $('.intro')
		$el.width($el.parent().outerWidth())
		if (location.hash != '#contact' || 'work' || 'about-us' || '') {
			$($el).waypoint('sticky', {
				offset: 100 // Apply "stuck" when element 30px from top
			});

			// set the width of the intro div when window resizes
			window.addEventListener('resize', function() {
				$el.width($el.parent().outerWidth())
			})
		}
	});

})(this, jQuery);
