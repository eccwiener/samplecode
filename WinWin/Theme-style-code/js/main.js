$( document ).ready(function() {

    /*
    *
    *  We can now use test.winwinusa.com/#tablink to access bootstrap tabs via a link
    *
    * */

    var hash = window.location.hash;
    hash && $('ul.nav a[href="' + hash + '"]').tab('show');



    $('.nav-tabs a').click(function (e) {
        $(this).tab('show');
        var scrollmem = $('body').scrollTop();
        window.location.hash = this.hash;
        $('html,body').scrollTop(scrollmem);
    });

});


$(function(){ // document ready
   if ($('#sticky').length) { // make sure "#sticky" element exists
      var el = $('#sticky');
      var stickyTop = $('#sticky').offset().top; // returns number
      var stickyHeight = $('#sticky').outerHeight(true);

      $(window).scroll(function(){ // scroll event
          var limit = $('#footer').offset().top - stickyHeight - 300;

          var windowTop = $(window).scrollTop(); // returns number

          if (stickyTop < windowTop){
             el.css({ position: 'fixed', top: 0 });
          }
          else {
             el.css('position','static');
          }

          if (limit < windowTop) {
          var diff = limit - windowTop;
          el.css({top: diff});
          }
        });
   }
});

/*sticky for IE/opera browser warning*/
$(function(){ // document ready
   if ($('#sticky2').length) { // make sure "#sticky" element exists
      var el = $('#sticky2');
      var stickyTop = $('#sticky2').offset().top; // returns number
      var stickyHeight = $('#sticky2').outerHeight(true);

      $(window).scroll(function(){ // scroll event
          var limit = $('#footer').offset().top - stickyHeight - 300;

          var windowTop = $(window).scrollTop(); // returns number

          if (stickyTop < windowTop){
             el.css({ position: 'fixed', top: 0 });
          }
          else {
             el.css('position','static');
          }

          if (limit < windowTop) {
          var diff = limit - windowTop;
          el.css({top: diff});
          }
        });
   }
});



/*tooltip*/
$( function()
{
    var targets = $( '[rel~=tooltip]' ),
        target  = false,
        tooltip = false,
        title   = false;
 
    targets.bind( 'mouseenter', function()
    {
        target  = $( this );
        tip     = target.attr( 'title' );
        tooltip = $( '<div id="tooltip"></div>' );
 
        if( !tip || tip == '' )
            return false;
 
        target.removeAttr( 'title' );
        tooltip.css( 'opacity', 0 )
               .html( tip )
               .appendTo( 'body' );
 
        var init_tooltip = function() 
        {
            if( $( window ).width() < tooltip.outerWidth() * 1.5 )
                tooltip.css( 'max-width', $( window ).width() / 2 );
            else
                tooltip.css( 'max-width', 340 );
 
            var pos_left = target.offset().left + ( target.outerWidth() / 2 ) - ( tooltip.outerWidth() / 2 ),
                pos_top  = target.offset().top - tooltip.outerHeight() - 20;
 
            if( pos_left < 0 )
            {
                pos_left = target.offset().left + target.outerWidth() / 2 - 20;
                tooltip.addClass( 'left' );
            }
            else
                tooltip.removeClass( 'left' );
 
            if( pos_left + tooltip.outerWidth() > $( window ).width() )
            {
                pos_left = target.offset().left - tooltip.outerWidth() + target.outerWidth() / 2 + 20;
                tooltip.addClass( 'right' );
            }
            else
                tooltip.removeClass( 'right' );
 
            if( pos_top < 0 )
            {
                var pos_top  = target.offset().top + target.outerHeight();
                tooltip.addClass( 'top' );
            }
            else
                tooltip.removeClass( 'top' );
 
            tooltip.css( { left: pos_left, top: pos_top } )
                   .animate( { top: '+=10', opacity: 1 }, 50 );
        };
 
        init_tooltip();
        $( window ).resize( init_tooltip );
 
        var remove_tooltip = function()
        {
            tooltip.animate( { top: '-=10', opacity: 0 }, 50, function()
            {
                $( this ).remove();
            });
 
            target.attr( 'title', tip );
        };
 
        target.bind( 'mouseleave', remove_tooltip );
        tooltip.bind( 'click', remove_tooltip );
    });
});