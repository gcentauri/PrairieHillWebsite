
$(document).ready(function () {

    $(".sidebar-toggle").on('click', function () {

        $(this).find(".caret-toggle").toggleClass(function() {
            if ( $(this).is(".fa-ca") ) {
                return "fa-caret-down";
            } else {
                return "fa-caret-up";
            }
        });
        
        $(this).next(".toggle").slideToggle(600, function () {
        });
    });

    var newheight = $(window).height()*0.41;    
    $('.sidebar-scrollable').height(newheight);
    
    $(window).resize(function(){
	$('.sidebar-scrollable').height(newheight);
    });
    
    $(window).on('scroll', function () {
        var scrollTop = $(window).scrollTop();
        if (scrollTop > 50) {
            //$('#header').stop().animate({height: "75px"}, 50);
            //$('.subtitle').stop().animate({opacity: "0"}, 400);
            //$('#nav-main').stop().animate({transform: "translate(-100px,0)"}), 200);
        }
        else {
            //$('#header').stop().animate({height: "125px"}, 200);
            //$('.subtitle').stop().animate({opacity: "1"}, 200);
        }
    });
    
    //$('#mobile-preview-view').hide();
    
    //slick sliders
    var title_icon = "<span id='slide-control-title'><i class='fa fa-photo fa-1x'></i></span>"
    var prev_icon = "<i class='fa fa-angle-double-left'></i>"
    var next_icon = "<i class='fa fa-angle-double-right'></i>"
    var btn_classes = "slick-btn"

    var prev_btn_no_title = "<div class='small-1 columns'><button id='slick-prev-button' type='button' class='"
	+ btn_classes
	+ "slick-prev'>"
	+ prev_icon
	+ "</button></div>"
	+ "<div class='small-10 columns' style='text-align:center;'><strong>One Mile Children's Run in the pasture</strong></div>"

    var next_btn_no_title = "<div class='small-1 columns'><button id='slick-next-button' type='button' class='"
	+ btn_classes
	+ " slick-next'>"
	+ next_icon
	+ "</button></div>"
    
    var prev_btn = "<a id='slick-prev-button' type='button' class='"
	+ btn_classes
	+ " slick-prev'"
	+ " style='margin-right:5px;'"
	+ ">"
	+ prev_icon
	+ "</a>"
	+ "<a class='success' href='https://www.facebook.com/PrairieHillLearningCenter/photos_stream?ref=page_internal' style='margin:0;' target='_blank'>"
	+ title_icon
	+ "</a>"
    var next_btn = "<a id='slick-next-button' type='button' class='" + btn_classes +  " slick-next'>" + next_icon + "</a>"

    $('.ccf-slider').slick({
	autoplay: true,
	autoplaySpeed: 7000,
	arrows: true,
	initialSlide: 1,
	appendArrows: $('#slide-area'),
	prevArrow: prev_btn,
	nextArrow: next_btn,
	draggable: false,
	//vertical: true,
	//fade: true,
	respondTo: 'min'
    });
    
    $('.staff-slider').slick({
	autoplay: true,
	autoplaySpeed: 6000,
	arrows: true,
	initialSlide: 0,
	centerMode: true,
	centerPadding: '100px',
	appendArrows: $('#slide-area'),
	prevArrow: prev_btn,
	nextArrow: next_btn,
	draggable: false,
	respondTo: 'min',
	vertical: true
    });

    $('.funrun-slider').slick({
	autoplay: true,
	autoplaySpeed: 6000,
	arrows: true,
	initialSlide: 0,
	appendArrows: $('#fun-run-control'),
	//appendArrows: $('.fun-run-slide'),
	prevArrow: prev_btn_no_title,
	nextArrow: next_btn_no_title,
	//centerMode: true,
	//centerPadding: '100px',
	draggable: false,
	respondTo: 'min',
	//vertical: true,
	adaptiveHeight: true
    });

    $('.footer-slider').slick({
	autoplay: true,
	autoplaySpeed: 7000,
	arrows: false,
	initialSlide: 0,
	appendArrows: $('#slide-area'),
	draggable: false,
	fade: true,
	//respondTo: 'min'
    });
    
    $('.programs-slider').slick({
	autoplay: true,
	autoplaySpeed: 14000,
	arrows: true,
	initialSlide: 0,
	appendArrows: $('#slide-area'),
	prevArrow: prev_btn,
	nextArrow: next_btn,
	draggable: false,
	fade: true,
	respondTo: 'min',
	easing: 'easeInElastic'
	//speed: 2000
	//vertical: true
    });

    $('.home-slider').slick({
	autoplay: true,
	autoplaySpeed: 7000,
	arrows: true,
	initialSlide: 0,
	appendArrows: $('#slide-area'),
	prevArrow: prev_btn,
	nextArrow: next_btn,
	draggable: false,
	fade: true,
	respondTo: 'min'
	//speed: 2000
	//vertical: true
    });

    $('.uniq-slider').slick({
	autoplay: true,
	autoplaySpeed: 3000,
	arrows: false,
	centerMode: true,
	draggable: false,
	fade: true,
	respondTo: 'min'
    });

    $('.news-slider').slick({
	autoplay: true,
	autoplaySpeed: 7000,
	arrows: true,
	initialSlide: 0,
	appendArrows: $('#slide-area'),
	prevArrow: prev_btn,
	nextArrow: next_btn,
	draggable: false,
	fade: true,
	respondTo: 'min'
	//speed: 2000
	//vertical: true
    });
    //
    
    $(function($) {
        $('a[href*="#"]:not([href="#"])').click(function() {
            if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
                if (target.length) {
                    $('html, body').animate({
                        scrollTop: target.offset().top
                    }, 1000);
                    return false;
                }
            }
        });
    });

    
    // $(".staff-img").click(function() {
    // 	$(this).animate({
    // 	    width: "200px",
    // 	    height: "200px"
    // 	});
    // });
    
    // $(".member").hover(function() {
    // 	//	 alert(ptop);
    // 	$(this).children(".staff-img").animate({
    // 	    width: "400px",
    // 	    height: "400px",
    // 	    //	 }, 500, function() {
    // 	}, 1000);
    // 	//	   $(this).animate({
    // 	//	     width: "200px",
    // 	//	     height: "200px"
    // 	//	   });
    // 	//	 });
    // });
    
    //$('#quote').hide().fadeIn(3000);

    $('body').hover(function() {
	/*	 $('#credits').show();
		 }, function() {
		 $('#credits').hide();*/
    });

    var winHeight = $(window).height();
    var tabHeight = $('#tab').height();
    var diffHeight = winHeight - tabHeight*2 - 20;

    // $('.top-buffer').click(function () {
    // 	if($('#arrow-switch').hasClass("dropped")) {
    // 	    $('#arrow-switch').removeClass("glyphicon-arrow-up dropped").addClass("glyphicon-arrow-down");
    // 	    $('#content').animate({
    // 		top: tabHeight
    // 	    }, 1000);
    // 	    $('#credits').hide();
    // 	}
    // 	else {
    // 	    $('#arrow-switch').removeClass("glyphicon-arrow-down").addClass("glyphicon-arrow-up dropped");
    // 	    $('#content').animate({
    // 		top: diffHeight
    // 	    }, 1000);
    // 	    $('#credits').show();
    // 	}
    // }); 

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

    //$("#slideshow > div:gt(0)").hide();

    $('#load-spinner').hide();
    
    $('#activities-load').on('click', function() {
	$('#load-spinner').show();
    });

    var filtered = false;
    
    $('#financial-info-button').on('click', function() {
	//$('#primary-element').scrollTo('#financial-info');
	if (filtered === false) {
	    $('.programs-slider').slick('slickFilter','#financial-info');
	    $(this).html("<i class='fa fa-arrow-left fa-2x' style='color:gold;'></i> Programs");
	    filtered = true;
	} else {
	    $('.programs-slider').slick('slickUnfilter');
	    $(this).html("Financial Information <i class='fa fa-arrow-right fa-2x' style='color:gold;'></i>");
	    filtered = false;
	}
    });

    $('#mobile-preview-button').on('click', function() {
	//$('#mobile-preview-view').toggleClass('hidden');
	//$('#mobile-preview-view').animate(
	//{
	//opacity : 1
	//}
	//);
	//$('#mobile-preview-view').fadeIn();
	//$(this).hide();
	//$('#redirect-message').hide();
	$('#mobile-logo-placeholder').animate(
	    {
		width : '11%',
		top : '1%',
		left : '80%'
	    }, 2200, 'easeInOutQuad'
	);
    });

    // $("#primary-element").niceScroll({
    // 	horizrailenabled: false,
    // 	railalign: 'right',
    // 	background: 'blue'
    // });

    // $("#primary-element").getNiceScroll().resize();

    //$("#primary-element").jScrollPane(
    //{
    //showArrows: true
    //}
    //);
});
