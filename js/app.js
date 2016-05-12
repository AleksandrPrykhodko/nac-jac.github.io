jQuery(function ($) {
	/*====================================
	pageloader 
	======================================*/
	window.addEventListener('DOMContentLoaded', function() {
          "use strict";
          new QueryLoader2(document.querySelector("body"), {
              barColor: "#18a3dd",
              backgroundColor: "#fff",
              percentage: true,
              barHeight: 2,
              minimumTime: 500,
              fadeOutTime: 1000
          });
      });
	

	/*====================================
	Initiat WOW JS 
	======================================*/
	new WOW().init();



	/*====================================
	Countdown
	======================================*/
	$('.counter-content').bind('inview', function(event, visible, visiblePartX, visiblePartY) {
		if (visible) {
			$(this).find('.counter').each(function () {
				var $this = $(this);
				$({ Counter: 0 }).animate({ Counter: $this.text() }, {
					duration: 2000,
					easing: 'swing',
					step: function () {
						$this.text(Math.ceil(this.Counter));
					}
				});
			});
			$(this).unbind('inview');
		}
	});


	/*====================================
	init flexslider 
	======================================*/
	$(window).load(function() {
	  $('.flexslider').flexslider({
	    slideshow: false,
	    animation: "slide",
	    controlsContainer: $(".custom-controls-container"),
	    customDirectionNav: $(".custom-navigation a")
	  });
	});


	/*====================================
	Portfolio Carousel 
	======================================*/
	$(document).ready(function() {
	  var owl = $("#carousel-testimonials");
	  owl.owlCarousel({
	     
	      itemsCustom : [
	        [0, 1],
	        [1600, 1]
	      ],
	      navigation : false,
	      pagination: true,
	  });
	 
	});


	/*====================================
	Initlize Onepagenav 
	======================================*/
	$('#main-navigation').onePageNav({
	    filter: ':not(.external)'
	});


	/*====================================
	Customize Menu 
	======================================*/
	$(window).on('scroll', function(){
		if( $(window).scrollTop()>100 ){
			$('#main-navbar').addClass('navbar-change');
		} else {
			$('#main-navbar').removeClass('navbar-change');

		}
	});

    
 	/*====================================
	Mailchimp
	======================================*/
	$('#subscribe-form').ajaxChimp({ 
	    url: 'http://doelit.us10.list-manage.com/subscribe/post?u=b02e4f21e264536eff4820875&amp;id=4d57faf2cb' 
	    /* Replace Your AjaxChimp Subscription Link */
	});

});


/*====================================
menu
======================================*/
(function() {

	var bodyEl = document.body,
		content = document.querySelector( '.contents' ),
		openbtn = document.getElementById( 'open-button' ),
		closebtn = document.getElementById( 'close-button' ),
		isOpen = false;

	function init() {
		initEvents();
	}

	function initEvents() {
		openbtn.addEventListener( 'click', toggleMenu );
		if( closebtn ) {
			closebtn.addEventListener( 'click', toggleMenu );
		}
	}

	function toggleMenu() {
		if( isOpen ) {
			classie.remove( bodyEl, 'show-menu' );
		}
		else {
			classie.add( bodyEl, 'show-menu' );
		}
		isOpen = !isOpen;
	}

	init();

})();
