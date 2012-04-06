//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require swfobject.js
//= require uploadify/jquery.uploadify.min.js
//= require jquery.ui.nestedSortable.js
//= require redactor/js/redactor/redactor.js

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest("tbody").hide();
}

$(document).ready(function(){	
	    $(".russian_globalize").click(function(){
	        $("#russian_table").show();
	        $("#english_table").hide();
	    });
	    $(".english_globalize").click(function(){
	        $("#english_table").show();
	        $("#russian_table").hide();
	    });
	 $("#english_table").hide();
});




function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).closest("tbody").before(content.replace(regexp, new_id));
}

function changeSelect() {
		var f = $(this).closest("form"),
			url = "/admin/sections/" + f.find("select#section_id").val() + "/dish_categories";
			if (f.find("select#dish_category_id").val()) {
				url += "/" + f.find("select#dish_category_id").val() + "/dishes"
			};
		location = url;
}

$(function(){
	$("select.change-location").change(function(){
		changeSelect.call(this);
	});
});

function SelectDependent(first,second) {
	this.firstSelect = first,
	this.secondSelect = second
};

SelectDependent.prototype = {
	afterPrint: function() {},
	showOrHide: function(options,secondary) {
		if(options) {
			secondary.html(options);
		} else {
			secondary.html("<option value=''>&nbsp;</option>");
		};
		this.afterPrint();
	},
	doThis:	function(select,secondary,secondary_html) {
		select_item = select.find('option:selected').text();
		escaped_select_item = select_item.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
		options = $(secondary_html).filter("optgroup[label='" + escaped_select_item + "']").html();
		this.showOrHide(options,secondary);
	},	
	init: function(){
		var self = this;
		var select_item, 
			escaped_select_item, 
			options,
			secondary = $(self.secondSelect),
			secondary_html = secondary.html();
		self.doThis($(self.firstSelect),secondary,secondary_html);
		$(self.firstSelect).change(function() {
			self.doThis($(this),secondary,secondary_html);
		});
	}
};

$(function(){
	$('textarea:not(.nowred)').each(function(){
		$(this).redactor();
	});
	
	(new SelectDependent("#section_id","#dish_category_id")).init();
	(function(){
		var sel = new SelectDependent("#section_id","#dish_category_id");
		sel.afterPrint = function(){
			//первый запуск функции пустой, при загрузке, дабы избежать рекурсии и перезагрузки страницы.
			//далее определяем функцию, что должно происходить при последующих вызовах.
			sel.afterPrint = function() {
				changeSelect.call($(this.firstSelect).get(0));
			};
		};
		sel.init();
	})();
	
	/*
	$("table.checkboxes input:checkbox").click(function(e){
		var tr = $(this).closest("tr");
		tr.prevAll("tr").find("input:checkbox").attr("checked",true);
		tr.nextAll("tr").find("input:checkbox").attr("checked",false);
		var cs = tr.closest("table.checkboxes").find("input:checkbox");
		cs = cs.map(function(n){
			return ("dishes[" + this.value + "][visible]=" + ($(this).attr("checked") ? 1 : 0));
		});
		cs = $.makeArray(cs).join("&") + "&" + $("meta[name=csrf-param]").attr("content") + "=" + $("meta[name=csrf-token]").attr("content");
		$.ajax({
			type: "POST",
			url: "/admin/dishes/visible",
			data: cs
		})
	});
	*/

	$("table.checkboxes input:checkbox").change(function(e){
		var c = $(this);
		window.location = "/admin/dishes/" + c.val() + "/visible";
	});	
	
	$(document).ready(function() {
		$('ol.sortable').nestedSortable({
			disableNesting : 'no-nest',
			forcePlaceholderSize : true,
			handle : 'div:not(.freeze)',
			helper : 'clone',
			items : 'li',
			//maxLevels : 2,
			opacity : .6,
			placeholder : 'placeholder',
			revert : 250,
			tabSize : 25,
			tolerance : 'pointer',
			toleranceElement : '> div',
			update : function() {
				/*
				var serialized = $('ol.sortable').nestedSortable('serialize');
				$.ajax({
					url : '/admin/categories/sort',
					data : serialized
				});
				*/
			}
		});
	});

 	
});
