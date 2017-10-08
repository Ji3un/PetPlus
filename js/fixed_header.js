$(document).ready(function () {
    $(window).scroll(function () {
        if ($(this).scrollTop() > 205) {
            $('#fixed_header_wrap').fadeIn(80);
        } else {
            $('#fixed_header_wrap').fadeOut(80);
        }
    });
});