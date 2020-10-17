$(function() {
    var popup = $('#popup');
    var flag = true; // （コードは書いていないけど）ローカルストレージにでも保存しておけばいい
    $(window).scroll(function() {
        if (flag && $(this).scrollTop() > 300) {
            popup.fadeIn();
        } else {
            popup.hide();
        }
    });
    $('button').click(function() {
        flag = false; // （コードは書いていないけど）ローカルストレージにでも保存しておけばいい
        $('#popup').hide();
    });
});