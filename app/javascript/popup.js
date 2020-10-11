    $(function() {
        var popup = $('#popup')
        $(window).scroll(function() {
            if ($(this).scrollTop() > 300) {
                popup.fadeIn();
            } else {
                popup.hide();
            }
        });
        $('button').click(function() {
            $('#popup').hide();
        });
    });
