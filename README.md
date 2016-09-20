# Files

## ├── [app](./app)

### ├── [assets](./app/assets)

-   ├── images

-   ├── [javascripts](./app/assets/javascripts)

    -   ├── [activities.js](./app/assets/javascripts/activities.js)
    
            //HEY THERE!!
            $(document).ready(function() {
            
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
            
            });
            
            //use js spread arguments? (like splat arguments) => https://javascriptweblog.wordpress.com/2011/01/18/javascripts-arguments-object-and-beyond/
    
    -   ├── [application.js](./app/assets/javascripts/application.js)
    
    -   ├── bootstrap-datetimepicker.js
    
    -   ├── ccf.js
    
    -   ├── comfortable<sub>mexican</sub><sub>sofa</sub>
    
    -   ├── comfy
    
    -   ├── events.js
    
    -   ├── instagram-feed.js
    
    -   ├── jquery.mousewheel.js
    
    -   ├── jquery.skroller.js
    
    -   ├── jquery.skroller.min.js
    
    -   ├── main.js.coffee
    
    -   ├── pages.js
    
    -   └── shifts.js

-   └── [stylesheets](./app/assets/stylesheets)

    -   ├── activities.css.scss
    
    -   ├── [application.css.scss](./app/assets/stylesheets/application.css.scss)
    
    -   ├── [bootstrap<sub>and</sub><sub>customization</sub>.css.scss](./app/assets/stylesheets/bootstrap_and_customization.css.scss)
    
    -   ├── ccf.scss
    
    -   ├── comfortable<sub>mexican</sub><sub>sofa</sub>
    
    -   ├── comfy
    
    -   ├── events.scss
    
    -   ├── [foundation<sub>and</sub><sub>overrides</sub>.scss](./app/assets/stylesheets/foundation_and_overrides.scss)
    
    -   ├── jquery.jscrollpane.css
    
    -   ├── pages.scss
    
    -   ├── perfect-scrollbar.css
    
    -   ├── perfect-scrollbar.css.scss
    
    -   ├── perfect-scrollbar.min.css
    
    -   └── shifts.css.scss

### ├── concerns

### ├── [controllers](./app/controllers)

-   ├── [activities<sub>controller</sub>.rb](./app/controllers/activities_controller.rb)

-   ├── [api](./app/controllers/api)

    -   ├── [base.rb](./app/controllers/api/base.rb)
    
            # module API
            #   class Base < Grape::API
            #     mount API::V1::Base
            #   end
            # end
    
    -   └── v1

-   ├── [application<sub>controller</sub>.rb](./app/controllers/application_controller.rb)

-   ├── ccf<sub>controller</sub>.rb

-   ├── comfy

-   ├── concerns

-   ├── contacts<sub>controller</sub>.rb

-   ├── events<sub>controller</sub>.rb

-   ├── [omniauth<sub>callbacks</sub><sub>controller</sub>.rb](./app/controllers/omniauth_callbacks_controller.rb)

-   ├── pages<sub>controller</sub>.rb

-   ├── registrations<sub>controller</sub>.rb

-   ├── [sessions<sub>controller</sub>.rb](./app/controllers/sessions_controller.rb)

-   ├── [shifts<sub>controller</sub>.rb](./app/controllers/shifts_controller.rb)

-   ├── [users<sub>controller</sub>.rb](./app/controllers/users_controller.rb)

-   └── volunteers<sub>controller</sub>.rb

### ├── [helpers](./app/helpers)

-   ├── activities<sub>helper</sub>.rb

-   ├── [application<sub>helper</sub>.rb](./app/helpers/application_helper.rb)

-   ├── events<sub>helper</sub>.rb

-   ├── guests<sub>helper</sub>.rb

-   ├── pages<sub>helper</sub>.rb

-   └── shifts<sub>helper</sub>.rb

### ├── inputs

### ├── mailers

### ├── [models](./app/models)

-   ├── [ability.rb](./app/models/ability.rb)

-   ├── [activity.rb](./app/models/activity.rb)

-   ├── admin.rb

-   ├── comfy

-   ├── concerns

-   ├── contact.rb

-   ├── event.rb

-   ├── [guest.rb](./app/models/guest.rb)

-   ├── [identity.rb](./app/models/identity.rb)

-   ├── .keep

-   ├── page.rb

-   ├── [shift.rb](./app/models/shift.rb)

-   ├── [user.rb](./app/models/user.rb)

-   └── volunteer.rb

### ├── serializers

### └── [views](./app/views)

-   ├── activities

-   ├── api

-   ├── comfy

-   ├── contacts

-   ├── devise

-   ├── events

-   ├── [layouts](./app/views/layouts)

    -   ├── [application.html.erb](./app/views/layouts/application.html.erb)
    
    -   ├── \_arrowtab.html.erb
    
    -   ├── \_buffer<sub>variations</sub>.html.erb
    
    -   ├── \_ccf<sub>side</sub>.html.erb
    
    -   ├── \_expand<sub>retract</sub><sub>buttons</sub>.html.erb
    
    -   ├── \_extra.html.erb
    
    -   ├── \_footer.html.erb
    
    -   ├── \_foundation<sub>side</sub>.html.erb
    
    -   ├── [\_header.html.erb](./app/views/layouts/_header.html.erb)
    
    -   ├── \_instagram.html.erb
    
    -   ├── \_large<sub>header</sub>.html.erb
    
    -   ├── \_menu.html.erb
    
    -   ├── \_menu<sub>mobile</sub><sub>extra</sub>.html.erb
    
    -   ├── \_mobile<sub>static</sub><sub>menu</sub>.html.erb
    
    -   ├── [\_nav.html.erb](./app/views/layouts/_nav.html.erb)
    
    -   ├── \_paypal<sub>btn</sub>.html.erb
    
    -   ├── \_quote<sub>filter</sub>.html.erb
    
    -   ├── \_quote.html.erb
    
    -   ├── \_skrollr.html.erb
    
    -   ├── \_small<sub>header</sub>.html.erb
    
    -   ├── \_static<sub>menu</sub>.html.erb
    
    -   ├── \_title.html.erb
    
    -   ├── useful-snippets.html.erb
    
    -   ├── \_user<sub>menu</sub>.html.erb
    
    -   └── \_volunteer<sub>menu</sub>.html.erb

-   ├── [pages](./app/views/pages)

    -   ├── \_about2.html.erb
    
    -   ├── \_about.html.erb
    
    -   ├── [about.html.erb](./app/views/pages/about.html.erb)
    
    -   ├── add<sub>shift</sub>.html.erb
    
    -   ├── add<sub>user</sub><sub>idee</sub>.html.erb
    
    -   ├── \_blah.html.erb
    
    -   ├── calendar.html.erb
    
    -   ├── \_camp<sub>brief</sub>.html.erb
    
    -   ├── [ccf.html.erb](./app/views/pages/ccf.html.erb)
    
    -   ├── ccf<sub>info</sub>.html.erb
    
    -   ├── \_ccf<sub>menu</sub>.html.erb
    
    -   ├── \_ccf<sub>slide</sub>.html.erb
    
    -   ├── \_ccf<sub>slide</sub><sub>layout</sub>.html.erb
    
    -   ├── \_contact.html.erb
    
    -   ├── contact.html.erb
    
    -   ├── csvupload.html.erb
    
    -   ├── donate.html.erb
    
    -   ├── edit.html.erb
    
    -   ├── events.html.erb
    
    -   ├── \_financial<sub>info</sub><sub>button</sub>.html.erb
    
    -   ├── \_form.html.erb
    
    -   ├── foundation<sub>template</sub>.html.erb
    
    -   ├── [home.html.erb](./app/views/pages/home.html.erb)
    
    -   ├── index.html.erb
    
    -   ├── index.json.jbuilder
    
    -   ├── jobs.html.erb
    
    -   ├── jquery<sub>instagram</sub>.html.erb
    
    -   ├── \_latest.html.erb
    
    -   ├── \_legal.html.erb
    
    -   ├── legal<sub>info</sub>.html.erb
    
    -   ├── new.html.erb
    
    -   ├── \_news.html.erb
    
    -   ├── news.html.erb
    
    -   ├── \_news<sub>slider</sub>.html.erb
    
    -   ├── \_page<sub>add</sub><sub>about</sub>.html.erb
    
    -   ├── \_page<sub>add</sub><sub>calendar</sub>.html.erb
    
    -   ├── \_page<sub>add</sub><sub>case</sub>.html.erb
    
    -   ├── \_page<sub>add</sub><sub>contact</sub>.html.erb
    
    -   ├── \_page<sub>add</sub><sub>news</sub>.html.erb
    
    -   ├── \_page<sub>add</sub><sub>programs</sub>.html.erb
    
    -   ├── \_page<sub>add</sub><sub>quote</sub>.html.erb
    
    -   ├── pages.html
    
    -   ├── pages.org
    
    -   ├── programs.html.erb
    
    -   ├── sandbox.html.erb
    
    -   ├── show.html.erb
    
    -   ├── show.json.jbuilder
    
    -   ├── staff<sub>bod</sub>.html.erb
    
    -   ├── staff.html.erb
    
    -   ├── \_summer<sub>camp</sub>.html.erb
    
    -   ├── summer<sub>camp</sub>.html.erb
    
    -   ├── \_tour.html.erb
    
    -   ├── \_tour<sub>scenic</sub>.html.erb
    
    -   ├── \_uniq<sub>list</sub>.html.erb
    
    -   ├── [unique.html.erb](./app/views/pages/unique.html.erb)
    
    -   ├── \_unique.html.erb
    
    -   ├── volunteer.html.erb
    
    -   └── \_zero<sub>height</sub>.html.erb

-   ├── scratch.html.erb

-   ├── [shifts](./app/views/shifts)

    -   ├── add<sub>shift</sub>.html.erb
    
    -   ├── ajax.html
    
    -   ├── edit.html.erb
    
    -   ├── \_form.html.erb
    
    -   ├── index.html.erb
    
    -   ├── index.html.haml
    
    -   ├── index.json.jbuilder
    
    -   ├── index.xls.erb
    
    -   ├── index.xls.erb.bak
    
    -   ├── index.xlsx.axlsx
    
    -   ├── \_login.html.erb
    
    -   ├── login.html.erb
    
    -   ├── new.html.erb
    
    -   ├── sandbox.html.erb
    
    -   ├── \_shift<sub>filler</sub>.html.erb
    
    -   ├── \_shift<sub>match</sub>.html.erb
    
    -   ├── show.html.erb
    
    -   ├── \_sub.html.erb
    
    -   ├── user<sub>shifts</sub>.html.erb
    
    -   └── [volunteer.html.erb](./app/views/shifts/volunteer.html.erb)

-   ├── [users](./app/views/users)

    -   ├── [finish<sub>signup</sub>.html.erb](./app/views/users/finish_signup.html.erb)

-   └── volunteers

## ├── bin

## ├── .bundle

## ├── [config](./config)

### ├── [application.rb](./config/application.rb)

### ├── boot.rb

### ├── database.yml

### ├── environment.rb

### ├── [environments](./config/environments)

-   ├── [development.rb](./config/environments/development.rb)

-   ├── production.rb

-   └── test.rb

    0 directories, 5 files

### ├── [initializers](./config/initializers)

-   ├── [assets.rb](./config/initializers/assets.rb)

-   ├── backtrace<sub>silencers</sub>.rb

-   ├── comfortable<sub>mexican</sub><sub>sofa</sub>.rb

-   ├── cookies<sub>serializer</sub>.rb

-   ├── dev<sub>environment</sub>.rb

-   ├── [devise.rb](./config/initializers/devise.rb)

-   ├── filter<sub>parameter</sub><sub>logging</sub>.rb

-   ├── foreman<sub>debugger</sub>.rb

-   ├── form.rb

-   ├── inflections.rb

-   ├── log<sub>level</sub>.rb

-   ├── mime<sub>types</sub>.rb

-   ├── [omniauth.rb](./config/initializers/omniauth.rb)

-   ├── rails<sub>admin</sub>.rb

-   ├── ranged<sub>datetime</sub><sub>wrapper</sub>.rb

-   ├── refile.rb

-   ├── [safe<sub>yaml</sub>.rb](./config/initializers/safe_yaml.rb)

        # SafeYAMLL::OPTIONS[:default_mode] = :safe

-   ├── session<sub>store</sub>.rb

-   ├── simple<sub>form</sub><sub>bootstrap</sub>.rb

-   ├── simple<sub>form</sub>.rb

-   ├── timeout.rb

-   └── wrap<sub>parameters</sub>.rb

### ├── locales

### ├── [routes.rb](./config/routes.rb)

### ├── [secrets.yml](./config/secrets.yml)

### ├── sitemap.rb

### └── [unicorn.rb](./config/unicorn.rb)

    worker_processes Integer(ENV["WEB_CONCURRENCY"] || 2)
    timeout 60
    preload_app true
    
    before_fork do |server, worker|
      Signal.trap 'TERM' do
        puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
        Process.kill 'QUIT', Process.pid
      end
    
      defined?(ActiveRecord::Base) and
        ActiveRecord::Base.connection.disconnect!
    end
    
    after_fork do |server, worker|
      Signal.trap 'TERM' do
        puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
      end
    
      defined?(ActiveRecord::Base) and
        ActiveRecord::Base.establish_connection
    end

## ├── config.ru

## ├── [db](./db)

### ├── cms<sub>fixtures</sub>

### ├── development.sqlite3

### ├── [migrate](./db/migrate)

### ├── [schema.rb](./db/schema.rb)

### ├── [seeds.rb](./db/seeds.rb)

### ├── VolSpreadsheet.csv

### └── VolSpreedsheet.xlsx

## ├── dev

## ├── docs

## ├── dump.rdb

## ├── .env

## ├── [Gemfile](./Gemfile)

## ├── Gemfile.lock

## ├── .git

## ├── [.gitignore](./.gitignore)

## ├── gittest

## ├── lib

## ├── log

## ├── mysite.thor

## ├── [Procfile](./Procfile)

## ├── public

## ├── Rakefile

## ├── README.html

## ├── README.md

## ├── README.org

## ├── README.pdf

## ├── README.tex

## ├── shifts.zip

## ├── test

## ├── tmp

## ├── TODO.html

## ├── TODO.org

## └── vendor
