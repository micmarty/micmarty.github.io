// Show more functionality
$(".show-more a").on("click", function () {
    var $anchor = $(this);
    var $content = $anchor.parent().prev('div.content');
    var linkText = $anchor.text();

    if (linkText === 'Show more') {
        linkText = 'Show less';
        $content.switchClass('hideContent', 'showContent', 400);
    } else {
        linkText = 'Show more';
        $content.switchClass('showContent', 'hideContent', 400);
    };
    $anchor.context.text = linkText ;
});