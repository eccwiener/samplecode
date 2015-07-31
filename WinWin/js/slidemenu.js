 $(document).ready(function () {

        $('#slide-nav.navbar .container').append($('<div id="navbar-height-col"></div>'));

        // Enter your ids or classes
        var toggler = '.navbar-toggle';
        var pagewrapper = '#page-content';
        var navigationwrapper = '.navbar-header';
        var signIn = '.acctSignIn';
        var signUp = '.acctSignUp';
        var menuwidth = '100%'; // the menu inside the slide menu itself
        var slidewidth = '80%';
        var menuneg = '-100%';
        var slideneg = '-80%';

        $('#slidemenu form button[type="button"]').on("click", function(){
            var regToggler = $(this).attr("id");
            $(this).parent("form").hide();
            $(".pre-reg.acct"+regToggler).fadeToggle("slow");
        });


        $("#slide-nav").on("click", toggler, function (e) {


            var selected = $(this).hasClass('slide-active');

            $(signIn).show();
            $(signUp).hide();

            $('#slidemenu').stop().animate({
                left: selected ? menuneg : '0px'
            });

            $('#navbar-height-col').stop().animate({
                left: selected ? slideneg : '0px'
            });

            $(pagewrapper).stop().animate({
                left: selected ? '0px' : slidewidth
            });

            $(navigationwrapper).stop().animate({
                left: selected ? '0px' : slidewidth
            });


            $(this).toggleClass('slide-active', !selected);
            $('#slidemenu').toggleClass('slide-active');


            $('#page-content, .navbar, body, .navbar-header').toggleClass('slide-active');


        });


        var selected = '#slidemenu, #page-content, body, .navbar, .navbar-header';


        $(window).on("resize", function () {

            if ($(window).width() > 767 && $('.navbar-toggle').is(':hidden')) {
                $(selected).removeClass('slide-active');
                $(signIn).hide();
                $(signUp).hide();
            }
        });

    });