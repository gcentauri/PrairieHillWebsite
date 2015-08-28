$(document).ready( function() {
    $('#calendar').fullCalendar({
        eventsSources: [
	    {
	    url: '/shifts.json',
	    }
	],
        header: {
            center: 'agendaThreeDay,agendaDay'
        },
        defaultView: 'agendaThreeDay',
        aspectRatio: 1.5,
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
        },
        eventRender: function(event, element) {
	    //element.find('.fc-content').append("<div class='fc-title'>"+"</div>");
	    element.qtip({
		content: event.start
	    });
	},
    });
    
});


