
$(document).ready(function () {
    $(function($){
	if ($(window).width() > 767) {
	    skrollr.init({
		forceHeight: false,
		smoothScrolling: false
	    });//.refresh();

	}

	$(window).on('resize', function() {
	    if ($(window).width() <= 767) {
		skrollr.init().destroy();
	    }
	} (jQuery));
    });

    $(window).on('resize', function() {
	if ($(window).width() <= 767) {
	    $('#content').css('top', '200px');

	    //console.log('window-size_top-adjust_function');
	    //console.log($('#content').css('top'));
	}
    });

    $(function($){
	if ($(window).width() <= 767) {
	    $('#content').css('top', '200px');
	}
    });

    $(".staff-img").click(function() {
	$(this).animate({
	    width: "200px",
	    height: "200px"
	});
    });
    
    $(".member").hover(function() {
	//	 alert(ptop);
	$(this).children(".staff-img").animate({
	    width: "400px",
	    height: "400px",
	    //	 }, 500, function() {
	}, 1000);
	//	   $(this).animate({
	//	     width: "200px",
	//	     height: "200px"
	//	   });
	//	 });
    });
    
    $('#quote').hide().fadeIn(3000);

    $('body').hover(function() {
	/*	 $('#credits').show();
		 }, function() {
		 $('#credits').hide();*/
    });

    var winHeight = $(window).height();
    var tabHeight = $('#tab').height();
    var diffHeight = winHeight - tabHeight*2 - 20;

    $('.top-buffer').click(function () {
	if($('#arrow-switch').hasClass("dropped")) {
	    $('#arrow-switch').removeClass("glyphicon-arrow-up dropped").addClass("glyphicon-arrow-down");
	    $('#content').animate({
		top: tabHeight
	    }, 1000);
	    $('#credits').hide();
	}
	else {
	    $('#arrow-switch').removeClass("glyphicon-arrow-down").addClass("glyphicon-arrow-up dropped");
	    $('#content').animate({
		top: diffHeight
	    }, 1000);
	    $('#credits').show();
	}
    }); 

    $('a[href*=#]:not([href=#])').click(function() {
	if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
	    var target = $(this.hash);
	    target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
	    if (target.length) {
		$('html,body').animate({
		    scrollTop: target.offset().top
		}, 1000);
		return false;
	    }
	}
    });

});
