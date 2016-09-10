//HEY THERE!!


$(document).ready(function() {
    
    $(".guest-button").on("click", function(e) {
        e.preventDefault();
        $(this).next(".guest-field").slideToggle("slow", function() {
            
        });

        //$(this).parent().next('.user-submit').slideToggle("slow", function() {
        $(this).parent().next('.user-submit').children().attr("value", "Submit");
        //$(this).text("Remove Guest");
    });
    
    //$('.activity-shifts').hide();    
    $(".activity-area").on("click", function (e) {
        //$(".activity-area").hover( function () {
        e.preventDefault();
        /*$(this).next(".activity-shifts").slideToggle("slow", function () {
            // Animation complete.
        });*/
    });

});

//use js spread arguments? (like splat arguments) => https://javascriptweblog.wordpress.com/2011/01/18/javascripts-arguments-object-and-beyond/
