$('document').ready(function(){

var employees = [
{"name":"Akhil","projects_ror":"none","projects_jsq":"P1,P2","projects_and":"none","projects_ios":"none"},
{"name":"HK","projects_ror":"none","projects_jsq":"none","projects_and":"none","projects_ios":"none"},
{"name":"Alok","projects_ror":"none","projects_jsq":"none","projects_and":"none","projects_ios":"none"},
{"name":"Aayush","projects_ror":"none","projects_jsq":"none","projects_and":"none","projects_ios":"none"},
{"name":"Waseem","projects_ror":"none","projects_jsq":"none","projects_and":"none","projects_ios":"none"},
{"name":"Akshay","projects_ror":"none","projects_jsq":"none","projects_and":"none","projects_ios":"none"},
{"name":"Nishant","projects_ror":"none","projects_jsq":"none","projects_and":"none","projects_ios":"none"},
{"name":"KD","projects_ror":"none","projects_jsq":"none","projects_and":"none","projects_ios":"none"}
];
	addEmployees()
	var add = "add.png"
	var minus = "minus.png"
	var count = 0
	$('.employees').draggable({revert: true, helper: "clone"});
	
	$('.roles').droppable({
		drop: function(event, ui)
		{	
			$img = $('<img src="remove.png" class="remove-added" />')
			$element = ui.draggable.clone()
			$element.append($img)
			$div = createDivForToDo(ui.draggable.text())
			$id = $(this).attr("id")
			$img.attr("id","image-"+$id+"-"+count)
			$element.attr("id","roles-"+$id+"-"+count)
			if(checkDuplicate($(this),$element.text().trim()))
			{
				//Adding the new element to the to-do list
				$(this).find('ul').prepend($element)
				$element.removeClass("employees")
				$element.addClass("li-roles")
				$id = getId($element.attr("id"))
				$section = getSection($element.attr("id"))
				$('#to-do-'+$section).find('ul').append($div)
				$div.attr("id",'to-do-'+$section+"-"+$id)
				$('#to-do-'+$section).find('ul').show().focus()
				$('#to-do-'+$section).find('.image-added').attr("src","minus.png")
			}
			count++
		}
	})

	function addEmployees(){
		for(i = 0; i < employees.length; ++i){
		$('#div-employees').find('ul').append('<li class="employees">'+employees[i].name+'</li>')
	}
	}

	function createDivForToDo(text){
		var text_for_box = generateText(text)
		$main_div = $('<div class="div-area1"></div>')
		$p = $('<div><p class="para1">'+text+'</p>'+
			'<div class="box">'+text_for_box+'</div></div>')
		$text_div = $('<div class="text-area1"></div>')
		$img_div = $('<div><img class="image1" src="add.png" /></div>')
		$p1 = $('<p class="to-do-appended-inner-para"> Add Todos For '+text + ' Here </p>')
		$text_div.append($img_div).append($p1)
		$main_div.append($p).append($text_div)
		$li = $('<li class="li-to-do"></li>')
		$li.append($main_div)
		return ($li)
		/*
		$p = $('<p class="para">'+text+'</p>')
		$area = $('<textarea class="textarea"> Add Todos For '+text + " Here </textarea>")
		$div = $('<div></div>')
		$li = $('<li class="li-to-do"></li>')
		$div.append($p).append($area)
		$li.append($div)
		//console.log($li)
		return ($li)
		*/
	}	

	function generateText(text){
		var information = ""
		for (i=0;i<employees.length;++i)
		{
			if(employees[i].name == text)
			{
				information += "ROR : " + employees[i].projects_ror + "<br/>"
				information += "JS/JQuery : " + employees[i].projects_jsq + "<br/>"
				information += "Android : " + employees[i].projects_and + "<br/>"
				information += "IOS : " + employees[i].projects_ios + "<br/>"
			}
		}
		return information
	}

	function getId(text){
		var parts = text.split("-")
		return (parts[parts.length - 1])
	}

	function getSection(text){
		var parts = text.split("-")
		return (parts[parts.length - 2])
	}

	function checkDuplicate(element,text){
		console.log(element.find('ul').children().text())
		var array = element.find('ul').children().text().split(" ").toString()
		if(array.match(text)) return false
		else return true
	}	

	$('ul.added_emp').delegate("li.ui-draggable","hover", function(event) {
		$(this).find('img').toggle (event.type === "mouseenter")
		}) 
	
	
	$('.image-added').click(function(){
		$(this).attr("src",$(this).attr("src") == add ? minus : add)
		$(this).parent().children().eq(1).slideToggle('slow')
		//console.log($(this).parent().children().eq(-1))
	})

	//$('img').delegate(".remove-added","click",function(){ alert("Hello")})
	$('img.remove-added').live("click",function() {
			$count = $(this).attr("id")
			//console.log($count)
			if(confirm("Do You Want to Delete This Row??")){
				$(this).parent().remove()
				$section = getSection($count)
				$id = getId($count)
				$('#to-do-'+$section+"-"+$id).remove()
				count--
			}
	})

})