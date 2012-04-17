// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require "reddebox/jquery.reddebox"
//= require flexcroll

$(function(){
	$("table.section_images a").reddeBox();
	$("a.lightbox-one").each(function(){
		$(this).reddeBox();
	});
	
	(function(){
		var sc = $("#scroll-styled");
		
		if (sc.length) {
			
			if (sc.closest("div.news").length) {
				// новости и специальные предложения
				sc.scrollLeft(0);
				var w = sc.find("table").width(),
					wScroll = 538*568/w,
					k = w/568,
					elems = sc.find("a.post"),
					elemsLength = elems.length,
					k1 = (568-wScroll)/(w-538),
					pages = $.map(elems,function(n,i){
						var cell = $(n).position().left;
						return {
							cell: cell,
							slider: Math.round(cell*k1)
						};
					});
					
				var slider = $("#scroll-styled-flexcroll-hscroller div");
				
				slider.width(Math.round(wScroll)).draggable({
					axis: "x",
					containment: 'parent',
					drag: function(event, ui) {
						sc.scrollLeft(k*ui.position.left);
					},
					stop: function(event, ui){
						var pageIndex = Math.round(sc.scrollLeft()/190),
							rest = sc.scrollLeft()%190;					
						sc.animate({scrollLeft: pages[pageIndex].cell},rest);
						slider.animate({left:pages[pageIndex].slider},rest);
						setTimeout(function(){slide()},3000);
					}
				});
				
				function slide() {
					var pageIndex = Math.round(sc.scrollLeft()/190),
						rest = sc.scrollLeft()%190;
					(pageIndex < (elemsLength-3)) ? pageIndex++ : pageIndex = 0;
					if (!slider.hasClass("ui-draggable-dragging")) {
						sc.animate({scrollLeft: pages[pageIndex].cell},600,"easeInOutExpo",function(){
							setTimeout(function(){slide()},3000);
						});
						slider.animate({left:pages[pageIndex].slider},600);
					};
				};
				
			} else {
				// Фотографии
				sc.scrollLeft(0);
				var w = sc.find("table").width(),
					wScroll = 424*424/w,
					k = w/424,
					elems = sc.find("td"),
					elemsLength = elems.length,
					pages = $.map(elems,function(n,i){
						return {
							cell: $(n).position().left,
							slider: Math.round(wScroll*i)
						};
					});
				var slider = $("#scroll-styled-flexcroll-hscroller div");
				
				slider.width(Math.round(wScroll)).draggable({
					axis: "x",
					containment: 'parent',
					drag: function(event, ui) {
						sc.scrollLeft(k*ui.position.left);
					},
					stop: function(event, ui){
						var pageIndex = Math.round(sc.scrollLeft()/424),
							rest = sc.scrollLeft()%424;					
						sc.animate({scrollLeft: pages[pageIndex].cell},rest);
						slider.animate({left:pages[pageIndex].slider},rest);
						setTimeout(function(){slide()},3000);
					}
				});	
				
				function slide() {
					var pageIndex = Math.round(sc.scrollLeft()/424),
						rest = sc.scrollLeft()%424;
					(pageIndex < (elemsLength-1)) ? pageIndex++ : pageIndex = 0;
					if (!slider.hasClass("ui-draggable-dragging")) {
						sc.animate({scrollLeft: pages[pageIndex].cell},600,"easeInOutExpo",function(){
							setTimeout(function(){slide()},3000);
						});
						slider.animate({left:pages[pageIndex].slider},600);
					};
				};
							
			};
			

			
			setTimeout(function(){slide()},3000);
		};
		

	})();
});

//РазвернутьСвернуть на страницу main
$(document).ready(function(){
    $(".expand_events").click(function(){
        $(".events").slideToggle("slow");
        $(this).toggleClass("active");
        if ($(this).text()=="Развернуть")
            {
               $(this).text("Свернуть")
            }
            else if ($(this).text()=="Roll up")
            {
               $(this).text("Expand")
            }
            else if ($(this).text()=="Expand")
            {
               $(this).text("Roll up")
            }
            else    
            {
               $(this).text("Развернуть")
            };
    });

});

$(document).ready(function(){
    $(".expand_sports").click(function(){
        $(".sports").slideToggle("slow");
        $(this).toggleClass("active");
        if ($(this).text()=="Развернуть")
            {
               $(this).text("Свернуть")
            }
            else if ($(this).text()=="Roll up")
            {
               $(this).text("Expand")
            }
            else if ($(this).text()=="Expand")
            {
               $(this).text("Roll up")
            }
            else    
            {
               $(this).text("Развернуть")
            };
    });
});

$(document).ready(function(){
    $(".expand_movies").click(function(e){
        var b,
        	link = $(this);
        
        if ($(this).data("expand")) {
			
			b = $(this).data("expand");	        
			
        } else {
        	
	        b = {};
	        b.me = $(".movies");
	        b.h1 = b.me.height();
	        b.text1 = $(this).text();
	        
	        var items = b.me.children("li");
	        if (items.filter(":hidden").length == 0) b.me.addClass("open");
	        items.show();
			b.h2 = b.me.height();
			b.text2 = $(this).data("text");
			$(this).data("expand",b);
			b.me.height(b.h1);
			
        };
        
        if (b.me.hasClass("open")) {
	        b.me.stop(true,true).animate({height: b.h1},function(){
	        	b.me.removeClass("open");
	        	link.text(b.text1);
	        });
        } else {
	        b.me.stop(true,true).animate({height: b.h2},function(){
	        	b.me.addClass("open");
	        	link.text(b.text2);
	        });
        };
                
        e.preventDefault();	
	
    });
});

$(document).ready(function(){
    $(".expand_dish").click(function(){
        var category_index = $(".expand_dish").index(this)
        $(".dish:eq("+category_index+")").slideToggle("slow");
        $(this).toggleClass("active");
        if ($(this).text()=="Развернуть")
            {
               $(this).text("Свернуть")
            }
            else if ($(this).text()=="Roll up")
            {
               $(this).text("Expand")
            }
            else if ($(this).text()=="Expand")
            {
               $(this).text("Roll up")
            }
            else    
            {
               $(this).text("Развернуть")
            };
    });
});

// слайдер
function theRotator() {

	$('.slider ul li, .slider_title li, .section_images ul li').css({opacity: 0.0});
	$('.slider ul li:first, .slider_title li:first, .section_images ul li:first').css({opacity: 1.0}).addClass('show');
    
    
	
    if($('.section_images ul li').size() > 1 || $('.slider ul li').size() > 1) {
        setInterval('rotate()',7000);
    }
}
 
function rotate() {	
	var current = ($('.slider ul li.show, .slider_title li.show, .section_images ul li.show')?  $('.slider ul li.show, .slider_title li.show, .section_images ul li.show') : $('.slider ul li:first, .slider_title li:first, .section_images ul li:first'));

	var next = ((current.next().length) ? ((current.next().hasClass('show')) ? $('.slider ul li:first, .slider_title li:first, .section_images ul li:first') :current.next()) : $('.slider ul li:first, .slider_title li:first, .section_images ul li:first'));	

 
	next.css({opacity: 0.0})
	.addClass('show')
	.animate({opacity: 1.0}, 3000);
 
	current.animate({opacity: 0.0}, 3000)
	.removeClass('show');
};
 
$(document).ready(function() {		
	theRotator();
});