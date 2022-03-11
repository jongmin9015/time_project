$(document).ready(function() {
    var wind = $(window),
    header = $('#gnbMenu'),
    headerOffsetTop = header.offset().top;

    console.log(headerOffsetTop);
    console.log(wind.scrollTop());
    wind.scroll(function() {
       if(wind.scrollTop()>= headerOffsetTop) {
        header.addClass('sticky');
       } else {
        header.removeClass('sticky');
      }
    });
});