$(document).ready(function() {

    $(function($) {
	$('.shifts-link').on('click', function() {
	    var li = $(this).parent();
	    $(this).addClass('success');
	    li.siblings("li").children("a").removeClass('success');
	    $('#all-link').removeClass('success');
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


    $(function($) {
	var toggle = $('.activity-toggle');
	var target = $('.activity-target');

	//target.hide();
	//toggle.css( "width" , "30%" );

	//remove target class
	//targets.each(function() {
	//$('.target').removeClass("target");
	//});
	
	toggle.on('click', function() {
	    var target  = $(this).next(".activity-target");
	    var targets = $(this).siblings(".target");

	    
	    $(this).animate( {
	     	//width: '100%'
	    });
	    
	    //$(this).addClass('wide');
	    $('.target').removeClass("target");
	    target.addClass("target");
	    $('.target').toggle("slow");
	});
    });

    $(function($) {
	$('.friend-field').hide();

	$('.add-friend-btn').on('click', function() {
	    $(this).hide();
	    console.log($(this).siblings('div'));
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
		$(content).hide();
	    };
	    hide_contents();
	}
	else if (fun == "show")
	{
	    function show_contents() {//GET a towel
		$(title).show();
		$(content).show();
	    };
	    show_contents();
	}
    };
    function hide_single(string) {
	toggle_category("hide", string);
    };
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
    function focus (string) {
	//hide all
	hide_single("all");
	hide_single("prep");
	hide_single("station");
	hide_single("teardown");
	//show chosen
	show_single(string);
    };

    focus("none");

    // switch between simple(table) & complex(js) views

    
    

/////////////////////////////////////////////////////////
    
    // function toggle_categories(fun, ..categories) {
    //     console.log(categories);
    //     $.each(categories, function (cat) {
    // 	toggle_category(fun, cat);
    //     });
    // };

    // // FUNCTION
    // function toggle_all_off() {
    //     //toggle_categories("hide", ["prep", "station", "teardown", "all"]);
    //     toggle_category("hide", "stations");
    //     //toggle_category("hide", "station");
    // };
    // //


    
    //buttons
    
    $('#prep-link').on( 'click', function() {
	focus("prep");
    });
    $('#teardown-link').on( 'click', function() {
	focus("teardown");
    });
    $('#station-link').on( 'click', function() {
	focus("station");
    });
    $('#all-link').on( 'click', function() {
	focus("all");
    });

    /// activity shift layout

    $('#guest-signup-trigger').on( 'click', function() {
     	$$('#guest-signup-toggle').toggle("slow");
    });
    
    /// buttons sandbox

    var ss_link //substring '-link' 
    
    ///^^^ buttons sandbox

    
    
    $('#calendar').fullCalendar({
	eventSources: [
	    {
		url: '/shifts.json',
		//		title: shift.activity_id,
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

    $('div.shifts-toggle').hide();
    
    $('a[href="#"]').click( function(e) {
	e.preventDefault();
    });
    
    $('.shifts-trigger').on('click', function(event) {
	//var shifts = $(this).next();

	$(this).next().toggle(1000);
    });

    $('#masonry-container').masonry({
	itemSelector: '.box',
	isFitWidth: true
    });

    //$('.hover-modal-reveal').mouseover(function() {
    //$('#vol-info').foundation('reveal', 'open');
    //});
});

//use js spread arguments? (like splat arguments) => https://javascriptweblog.wordpress.com/2011/01/18/javascripts-arguments-object-and-beyond/ 
