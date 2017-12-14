$(".show-more a").on("click", function() {
    var $anchor = $(this);
    var $content = $anchor.parent().prev('div.content');
    var linkText = $anchor.text();

    if ($anchor.data("hidden") == true || linkText.startsWith("Expand")) {
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