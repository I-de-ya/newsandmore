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
//= require jquery_ujs

//РазвернутьСвернуть на страницу main
$(document).ready(function(){
    $(".expand_events").click(function(){
        $(".events").slideToggle("slow");
        $(this).toggleClass("active");
        if ($(this).text()=="Развернуть")
            {
               $(this).text("Свернуть")
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
            else
            {
               $(this).text("Развернуть")
            }
    });
});
z
$(document).ready(function(){
    $(".expand_movies").click(function(){
        $(".movies").slideToggle("slow");
        $(this).toggleClass("active");
        if ($(this).text()=="Развернуть")
            {
               $(this).text("Свернуть")
            }
            else
            {
               $(this).text("Развернуть")
            }
    });
});

// слайдер
function theRotator() {
	// Устанавливаем прозрачность всех картинок в 0
	$('div.slider ul li').css({opacity: 0.0});
 
	// Берем первую картинку и показываем ее (по пути включаем полную видимость)
	$('div.slider ul li:first').css({opacity: 1.0});
 
	// Вызываем функцию rotate для запуска слайдшоу, 5000 = смена картинок происходит раз в 5 секунд
	setInterval('rotate()',10000);
}
 
function rotate() {	
	// Берем первую картинку
	var current = ($('div.slider ul li.show')?  $('div.slider ul li.show') : $('div.slider ul li:first'));
 
	// Берем следующую картинку, когда дойдем до последней начинаем с начала
	var next = ((current.next().length) ? ((current.next().hasClass('show')) ? $('div.slider ul li:first') :current.next()) : $('div.slider ul li:first'));	
 
	next.css({opacity: 0.0})
	.addClass('show')
	.animate({opacity: 1.0}, 3000);
 
	// Прячем текущую картинку
	current.animate({opacity: 0.0}, 3000)
	.removeClass('show');
};
 
$(document).ready(function() {		
	// Запускаем слайдшоу
	theRotator();
});