$(document).ready( function() {
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
    
    $('.shifts-trigger').click(function(event) {
	//var table = $(this).parent().siblings('div.shifts-toggle');
	//var table = $(this).parent().next();
	var table = $(this).next();
	table.toggle("slow");
    });

    $('#masonry-container').masonry({
	itemSelector: '.box',
	isFitWidth: true
    });

    //$('.hover-modal-reveal').mouseover(function() {
    //$('#vol-info').foundation('reveal', 'open');
    //});
});
