// Keyboard shortcuts for browsing pages of lists
(function($) {
    $(document).keydown(handleKey);
    function handleKey(e) {
        var left_arrow = 37;
        var right_arrow = 39;
        if (e.target.nodeName == 'BODY' || e.target.nodeName == 'HTML') {
                if (!e.ctrlKey && !e.altKey && !e.shiftKey && !e.metaKey) {
                    var code = e.which;
                    if (code == left_arrow) {
                        prevPage();
                    }
                    else if (code == right_arrow) {
                        nextPage();
                    }
                }
            }
    }

    function prevPage() {
        var href = $('.pagination .prev a').attr('href');
        if (href && href != document.location && href != "#") {
            document.location = href;
        }
    }

    function nextPage() {
        var href = $('.pagination .next_page a').attr('href');
        if (href && href != document.location && href != "#") {
        document.location = href;
        }
    }
})(jQuery);
