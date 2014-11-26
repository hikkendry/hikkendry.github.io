(function(w, $) {

	// Toggle contact
	var $nav = $('.pagenav');
	$nav.on('click', '.contact-toggle', function(e) {
		e.preventDefault();
		$('.contact.dropdown', $nav).toggleClass('active');
	});

	$("#contactForm").validate({
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

		// submitHandler: function(form) {
		// 	$.ajax({
		// 		dataType: 'jsonp',
		// 		url: "http://getsimpleform.com/messages/ajax?form_api_token=15ac098803f482a821d466247d285c2c",
		// 		data: $("#contactForm").serialize()
		// 	}).done(function() {
		// 		//callback which can be used to show a thank you message
		// 		//and reset the form
		// 		window.location.href = "/confirm";
		// 	});
		// }
	});

})(this, jQuery);
