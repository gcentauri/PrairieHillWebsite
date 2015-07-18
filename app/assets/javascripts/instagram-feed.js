function createPhotoElement(photo) {
    var innerHtml = $('<img >')
        .addClass('instagram-image')
    //.attr('src', photo.images.thumbnail.url);
	.attr('src', photo.images.standard_resolution.url);
    
    //   innerHtml = $('<a>')
    //        .attr('target', '_blank')
    //        .attr('href', photo.link)
    //        .append(innerHtml);

    //   return $('<div>')
    //        .addClass('instagram-placeholder')
    //        .attr('id', photo.id)
    //        .append(innerHtml);

    return $('<a>')
        .attr('target', '_blank')
	//.attr('href', photo.link)
        .append(innerHtml);
}

function didLoadInstagram(event, response) {
    var that = this;

    $.each(response.data, function(i, photo) {
	$(that).append(createPhotoElement(photo));
    });
}

$(document).ready(function() {
    var clientId = '3a3bbceef486471c930c405faed585f1';

    $('.instagram.hash').on('didLoadInstagram', didLoadInstagram);
    $('.instagram.hash').instagram({
	hash: 'prairiehill',
	count: 6,
	clientId: clientId
    });

    $('.instagram.nature').on('didLoadInstagram', didLoadInstagram);
    $('.instagram.nature').instagram({
	hash: 'natureistheclassroom',
	count: 5,
	clientId: clientId
    });
    
    $('.instagram.montessori').on('didLoadInstagram', didLoadInstagram);
    $('.instagram.montessori').instagram({
	hash: 'montessori',
	count: 5,
	clientId: clientId
    });
    
    $('.instagram.location').on('didLoadInstagram', didLoadInstagram);
    $('.instagram.location').instagram({
	location: {
	    id: 514276
	},
	count: 5,
	clientId: clientId
    });

    var path = location.pathname

    console.log(path);
    console.log($(window).width());

    $('.instagram.latlong').on('didLoadInstagram', didLoadInstagram);
    $('.instagram.latlong').instagram({
	search: {
	    lat: 40.636595,
	    lng: -96.707764
	},
	count: 6,
	clientId: clientId
    });
});

