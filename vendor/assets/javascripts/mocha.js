/*
 * --------------------------------------------------------------------
 * Simple Scroller
 * by Siddharth S, www.ssiddharth.com, hello@ssiddharth.com
 * Version: 1.0, 05.10.2009 	
 * --------------------------------------------------------------------
 */

$(document).ready(function() {	 
    var index = 0;
    var images = $("#gallery img");
    var thumbs = $("#thumbs img");
    var descriptions = $("#gallery .promotion");
    for (i=0; i<thumbs.length; i++) {
        $(thumbs[i]).addClass("thumb-"+i);
        $(thumbs[i]).attr("index",i);
        $(thumbs[i]).bind("click",function () {            
            index = parseInt($(this).attr("index"));
            show(index,200);
        })
        $(images[i]).addClass("image-"+i);
        $(images[i]).attr("index",i);
        if (i != 0) $(images[i]).hide();
        $(descriptions[i]).addClass("promo-"+i);
    }    
    show(0,400);
    setInterval(sift, 8000);	
    
    function sift() {        
        if (index<(thumbs.length-1)) {
            index = index + 1;
        } else {
            index = 0;
        }        
        show (index,400);
    }

    function init() {
        show(0,400);
    }

    function show(num,speed) {
        $(images).fadeOut(speed);
        $(descriptions).fadeOut(speed);
        $(".image-"+num).stop().fadeIn(speed);
        $(".promo-"+num).stop().fadeIn(speed);
    }    
});
