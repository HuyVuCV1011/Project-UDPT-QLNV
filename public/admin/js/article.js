$(document).ready(function() {
    $.ajax({
        url: `${window.origin}:81/?url=article/getArticles`,
        success: function(res) {
            if (res) {
                var response = JSON.parse(res);
                $('#article-container').html(html);
            }
        }
    });
});