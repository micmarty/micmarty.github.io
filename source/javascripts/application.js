$(function() {
    $("div.content").each(function() {
        classes = this.classList;
        if (["showContent"].indexOf(classes) >= 0) {
            $(this).data("hidden", false);
        } else if (["hideContent"].indexOf(classes) >= 0) {
            $(this).data("hidden", true);
        }
    });
});
$(".show-more a").on("click", function() {
    var $anchor = $(this);
    var $content = $anchor.parent().prev('div.content');
    var linkText = $anchor.text();
    if ($anchor.data("hidden") === true) {
        linkText = "Collapse ▲";
        $content.switchClass("hideContent", "showContent", 400);
        $anchor.data("hidden", false);
    } else {
        linkText = "Expand ▼";
        $content.switchClass("showContent", "hideContent", 400);
        $anchor.data("hidden", true);
    }
    $anchor.context.text = linkText;
});