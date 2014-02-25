(function(w, $){
	var sw = document.body.clientWidth,
		sh = document.body.clientHeight;

	$(w).resize(function(){ //Update dimensions on resize
		sw = document.body.clientWidth;
		sh = document.body.clientHeight;
		
		//updateAds();
	});


	//Navigation toggle
	if ( $(window).width() < 800 ) {
		$('.pagenav').on('click', '.nav-toggle-menu', function(e) {
			e.preventDefault();
			$(this).toggleClass('active');
			$('.nav').toggleClass('active');
			$('.header .contact').removeClass('active');
		});
		
		//Navigation toggle
		$('.pagenav').on('click', '.contact-toggle-menu', function(e) {
			e.preventDefault();
			$(this).toggleClass('active');
			$('.header .contact').toggleClass('active');
			$('.nav').removeClass('active');
		});
	};

})(this, jQuery);