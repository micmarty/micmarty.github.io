jQuery(document).ready(function(e){e(".level-bar-inner").css("margin-left","0%"),e(".level-bar-inner").css("width","100px"),e(window).on("load",function(){e(".level-bar-inner").each(function(){var n=e(this).data("level"),l=e(".level-bar-inner").css("height");e(this).animate({"margin-left":n,width:l},800)})}),e(".level-label").tooltip()});