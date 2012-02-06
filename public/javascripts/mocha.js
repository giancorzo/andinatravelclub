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
    $(thumbs).slice(0,3).clone().appendTo("#thumbs");
    for (i=0; i<thumbs.length; i++) {
        $(thumbs[i]).addClass("thumb-"+i);
        $(thumbs[i]).attr("index",i);
        $(thumbs[i]).bind("click",function () {            
            index = $(this).attr("index");
            show(index,200);
        })
        $(images[i]).addClass("image-"+i);
    }    
    show(0,400);
    setInterval(sift, 8000);
	
    function sift() {
        if (index<(thumbs.length-1)) {
         index+=1 ;
        } else {
         index=0
        }
        show (index,400);
    }
    
    function init() {
        show(0,400);
    }
	
    function show(num,speed) {
        $(images).fadeOut(speed);
        $(".image-"+num).stop().fadeIn(speed);
        console.log("img.image-"+num);
    }
});