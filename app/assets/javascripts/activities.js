//HEY THERE!!


$(document).ready(function() {

    //$('.activity-shifts').hide();    
    $(".activity-area").on("click", function (e) {
        //$(".activity-area").hover( function () {
        e.preventDefault();
        /*$(this).next(".activity-shifts").slideToggle("slow", function () {
            // Animation complete.
        });*/
    });


    $('.close-button').on('click', function () {
        $(this).parent().slideToggle('slow', function () {
        });
    });
    
    /*
    $(function($) {
        $('.shifts-link').on('click', function() {
            var li = $(this).parent();
            //console.log(li);

            $(this).addClass('success');
            //console.log($(this));

            li.siblings("li").children("a").removeClass('success');
            //console.log(li.siblings("li").children("a"));
            
            $('#all-link').removeClass('success');
            //console.log('#all-link');
        });
    });

    $('#all-link').on('click', function() {
        $(this).addClass('success');
        var prev_links = $('ul#category-selection').children("li").children("a");
        prev_links.each(function() {
            $(this).removeClass('success');
        });
        //$('ul#category-selection').children("li").removeClass('success');
    });

    $('.activity-target').hide();
    
    $('.activity-toggle').on('click', function() {
        var target = $(this).next('.activity-target');
        var height_diff = (0 - target.height());
        //target.slideToggle("slow");
        
        //$(this).parents('.activity-box').next('.activity-box').css('top', height_diff);
    });
    

    $(function($) {
        $('.friend-field').hide();

        $('.add-friend-btn').on('click', function() {
            $(this).hide();
            $(this).siblings('div').show();
        });
    });
    
    function category_name(category) {
        var content = "#" + category;
        return content;
    };
    function category_title_id(category) {
        var title = category_name(category) + "-title";
        return title;
    };
    function toggle_category(fun, string) {
        var content = category_name(string);
        var title = category_title_id(string);
        
        if (fun == "hide")
        {
            function hide_contents() {//GET a towel
                $(title).hide();
                $(title).removeClass('selected');
                console.log($(title));
                $(content).hide();
            };
            hide_contents();
        }
        else if (fun == "show")
        {
            function show_contents() {//GET a towel
                $(title).show();
                $(title).addClass('selected');
                $(content).show();

                var other_categories = $(content).siblings();
                var current_category = $(content).children().children('#activity-main-box');
                current_category.toggleClass('show-type');

                //console.log(other_categories);
                other_categories.each( function( index, element ) {
                    if ($(this).hasClass('show-type')) {
                        $(this).toggleClass('show-type');
                    }
                });
            };
            show_contents();
        }
    };
    function hide_single(string) {
        toggle_category("hide", string);
    };

    function hide_all() {
        hide_single("all");
        hide_single("prep");
        hide_single("station");
        hide_single("teardown");    
    };

    //hide_all();
    
    function show_single(string) {
        toggle_category("show", string);
    }

    function get_categories(category) {
        var categories_list = ["prep", "station", "teardown", "all"];
        var categories =
            {
                list: categories_list, length: categories_list.length
            };
        var category_index = categories_list.indexOf(category); // "prep" 0
    };

    //masonry
    function fix_height(){
        var current_cat = $('.show-type').children('#type').attr("class");

        var item_h = $('.masonry-item').height();
        var item_m = $('.masonry-tiem').css('margin');
        //console.log(item_m);
        var type_count = $('.show-type').children('.masonry-item' + '.' + current_cat).size();

        var height_fix = ((item_h * type_count) / 1.5);
        
        //console.log(height_fix);
        $('.masonry').css('height', height_fix);
    };
    ////

    function focus (string) {
        //hide all
        hide_all();
        //show chosen
        show_single(string);
        //fix_height();
    };

    hide_all();
    //focus("prep");
    
    //buttons
    //CATEGORY SWITCHER!!!
    //DRY it up
    $('#prep-link').on( 'click', function() {
        focus("prep");
        $('#primary-element').scrollTo('#activities-main');
    });
    $('#teardown-link').on( 'click', function() {
        focus("teardown");
        $('#primary-element').scrollTo('#activities-main');     
    });
    $('#station-link').on( 'click', function() {
        focus("station");
        $('#primary-element').scrollTo('#activities-main');
    });
    $('#all-link').on( 'click', function() {
        focus("all");
        $('#primary-element').scrollTo('#activities-main');
    });

    $('.category-title').on('click', function() {
        $('#primary-element').scrollTo(0);
    });
    ///

    
    /// activity shift layout
    $('#guest-signup-trigger').on( 'click', function() {
        $$('#guest-signup-toggle').toggle("slow");
    });
    
    $('#calendar').fullCalendar({
        eventSources: [
            {
                url: '/shifts.json',
                //              title: shift.activity_id,
            }
        ],
        eventColor: '#3f8000',
        header: {
            center: 'agendaThreeDay,agendaDay'
        },
        defaultView: 'agendaThreeDay',
        aspectRatio: 2.0,
        defaultDate: moment('2015-10-02'),
        minTime: "09:00:00",
        maxTime: "21:00:00",
        views: {
            agendaDay: {
                buttonText: 'Day'
            },
            agendaFourDay: {
                type: 'agenda',
                duration: { days: 4 },
                buttonText: '4 day'
            },
            agendaThreeDay: {
                type: 'agenda',
                duration: { days: 2 },
                buttonText: 'Main'
            }
        }
    });


    //?
    $('div.shifts-toggle').hide();
    // $('.shifts-trigger').on('click', function(event) {
    //  //var shifts = $(this).next();

    //  $(this).next().toggle(1000);
    // });
    //?

    
    $('a[href="#"]').click( function(e) {
        e.preventDefault();
    });
    

    //title-button on click

    //$('.arrow-down').hide();
    
    // $('.title-button').on('click', function(event) {
    //  $(this).toggleClass('success');

    //  var arrow_left = $(this).children().children('.arrow-left');
    //  var arrow_down = $(this).children().children('.arrow-down');
    //  var arrow = $(this).children().children('.arrow');
    //  var shift_arrows = $(this).parent('.arrow-guide')
    //      .parent('.activity-toggle')
    //      .next('.activity-target')
    //      .children('#shifts')
    //      .children('form')
    //      .children('#shift-single')
    //      .children('.arrow-guide')
    //      .children('.arrow');
    //  //there's got to be a better way! ^^^

    //  arrow.toggleClass('active', 500);

    //  shift_arrows.each(function() {
    //      $(this).toggleClass('active');
    //  });
    // });
    
    // $('#masonry-container').masonry({
    //  itemSelector: '.box',
    //  isFitWidth: true
    // });

    $('tr.open').hide();
    $('button#open').text("Show Open");

    $('button#open').bind('click', function(){
        $(this).toggleClass('success');
        $(this).toggleClass('open');

        //$(this).text("Hide Open", "Show Open");
        ($(this).text() === "Show Open") ? $(this).text("Hide Open") : $(this).text("Show Open");
        $('tr.open').toggleClass('show');
        $('tr.shift-time').css('background-color','red');
    });


    //ACTIVITIES SCROLL ANIMATION
    //primary
    var primary = $('div#primary-element');
    var primary_width = primary.width();
    var primary_height = primary.height();
    var primary_top = primary.css('top');
    //window
    var doc_width = $(window).width();
    var doc_height = $(window).height();
    //dash
    var dashboard = $('div#dashboard-element');
    var dashWidth = dashboard.width();
    var dashHeight = dashboard.height();
    var dashLeft = dashboard.css('left');
    //ccf info
    var info_height = $('div#ccf-info').height();
    var ccf_info = $('div#ccf-info');
    var ccf_height = ccf_info.height();
    var ccf_width = ccf_info.width();
    var ccf_top = ccf_info.css('top');
    var ccf_bg = ccf_info.css('background-color');
    var ccf_pos = ccf_info.css('position');
    var shifts_numbers_height = $('div#shifts-numbers').height();
    var category_tabs_height = $('div#category-tabs').height();
    var cur_dash_height = shifts_numbers_height + category_tabs_height

    //primary.scrollTo('#ccf-info');

    //console.log(primary.scrollTop());

    $('#retract-button').hide();
    
    $(function() {
        //primary.scroll(function() {

        $('#expand-button').on('click',function() {
            $(this).hide();
            //console.log($('.selected'));
            //focus("prep");
            $('#retract-button').show();

            $('div#header').fadeOut("slow");
            $('div#ph-title').fadeOut("slow");
            //$('div#footer-main').fadeOut("slow");
            $('#footer-buttons').fadeOut();

            $('div#welcome-element').hide();
            $('div#category-info').fadeOut();
            $('div#tabs-open-close').fadeOut();

            dashboard.hide();
            dashboard.animate(
                {
                    width: (doc_width - 160),
                    left: 0
                }, 2000, 'easeOutCirc'
            );

            primary.animate(
                {
                    top: cur_dash_height + 40,
                    width: (doc_width - 150),
                    //height: (doc_height - 250) CCF KEEP and modify behavior, dep. path/route
                    height: '80%' 
                }, 1000, 'easeOutCubic'
            );

            primary.css('border-radius','50px');
            
            $('div.category-title').animate(
                {
                    'margin-top' : '15px'
                }
            );

            //ccf-info
            ccf_info.css('position', 'fixed');
            ccf_info.css('background', 'transparent');
            ccf_info.toggleClass('bottom-shadow');
            ccf_info.animate(
                {
                    top: 0,
                    width: (doc_width - 160)
                }
            );

            dashboard.fadeIn("slow");
            //}
            //}
        });
        //else if ($(this).scrollTop() < 20) {
        //else if (this_top < 80) {
        //else {
        
        //      $(this).animate(
        //          {
        //              top: primary_top,
        //              width: primary_width + 37,
        //              height: primary_height
        //          }, 1000
        //      );

        //      $('div#header').fadeIn("slow");
        //      $('div#ph-title').fadeIn("slow");
        //      $('div#footer-main').fadeIn("slow");
        //      $('div#welcome-element').fadeIn(206);
        //      $('div#category-info').fadeIn(501);
        //      $('div#tabs-open-close').fadeIn(203);

        //      dashboard.animate(
        //          {
        //              width: dashWidth,
        //              left: dashLeft //?
        //          }, 345
        //      );

        //      //ccf-info
        //      ccf_info.css('position', ccf_pos);
        //      ccf_info.css('background', ccf_bg);
        
        //      //ccf_info.toggleClass('bottom-shadow');
        //      ccf_info.animate(
        //          {
        //              top: ccf_top,
        //              width: ccf_width + 37
        //          }
        //      );
        //     }
        // });
    });

    
    $('#retract-button').on('click',function() {
        $(this).hide();
        $('#expand-button').show();

        primary.css('border-radius','0');
        primary.animate(
            {
                top: primary_top,
                width: primary_width + 35,
                height: primary_height + 5
            }, 1000
        );

        $('div#header').fadeIn("slow");
        $('div#ph-title').fadeIn("slow");
        //$('div#footer-main').fadeIn("slow");
        $('#footer-buttons').fadeIn();

        $('div#category-info').fadeIn();
        $('div#welcome-element').fadeIn(1500);
        $('div#tabs-open-close').fadeIn();

        dashboard.hide();
        dashboard.animate(
            {
                width: dashWidth,
                left: dashLeft //?
            }, 345
        );

        //ccf-info
        ccf_info.css('position', ccf_pos);
        ccf_info.css('background', ccf_bg);
        ccf_info.toggleClass('bottom-shadow');
        ccf_info.animate(
            {
                top: ccf_top,
                width: ccf_width + 37
            }
        );

        dashboard.fadeIn("slow");
    });

    $(function() {
        // primary.scroll(function() {
        //     if (primary.scrollTop() > 40) {
        //      $('#heart-anim').animate(
        //          {
        //              'font-size':'80vw',
        //              'opacity':'0',
        //              'transform':'translate(1000px,500px)'
        //          }, 512, 'easeInCirc'
        //      );
        //      $('#heart-anim').css(
        //          {
        //              'position' : 'fixed',
        //              'top' : '10%',
        //              'left' : '25%'
        //          }
        //      );
        //     }
        // });
    });
*/    
});

//use js spread arguments? (like splat arguments) => https://javascriptweblog.wordpress.com/2011/01/18/javascripts-arguments-object-and-beyond/
