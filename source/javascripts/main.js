jQuery(document).ready(function ($) {


    /*======= Skillset *=======*/

    $('.level-bar-inner').css('margin-left', '0%');
    $('.level-bar-inner').css('width', '100px');

    $(window).on('load', function () {

        $('.level-bar-inner').each(function () {

            var offset = $(this).data('level');
            var height = $('.level-bar-inner').css('height');
            var itemWidth = 100;

            $(this).animate({
                'margin-left': offset,
                'width': height
            }, 800);

        });

    });

    /* Bootstrap Tooltip for Skillset */
    $('.level-label').tooltip();

});