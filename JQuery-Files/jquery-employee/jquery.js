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
			$img = $('<img />')
			$img.attr("src",src="remove.png")
			$img.addClass("remove-added")  
			
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
				$('#to-do-'+$section + " ul").append($div)
				$div.attr("id",'to-do-'+$section+"-"+$id)
				$('#to-do-'+$section + " ul").show().focus()
				$('#to-do-'+$section + " .image-added").attr("src","minus.png")
			}
			count++
		}
	})

	function addEmployees(){
		for(i = 0; i < employees.length; ++i){
		$li = $('<li></li>')
		$li.addClass("employees")
		$li.append(employees[i].name)
		$('#div-employees ul').append($li)
	}
}

	function createDivForToDo(text){
		var text_for_box = generateText(text)

	  $main_div = $('<div/>')
		$main_div.addClass("div-area1")

		$para_div = $('<div/>')
		$p = $('<p/>')
		$p.addClass("para1")
		$p.append(text)
		$para_div.append($p)
	
		$div_box = $('<div/>')
		$div_box.addClass("box")
		$div_box.append(text_for_box)
		$para_div.append($div_box)		
	
		$text_div = $('<div/>')
		$text_div.addClass("text-area1")

		$img_div = $('<div/>')
		$img = $('<img />')
		$img.addClass("image1")
		$img.attr("src","add.png")
		$img_div.append($img)

		$inner_para = $('<p></p>')
		$inner_para.addClass("to-do-appended-inner-para")
		$inner_para.append('Add Todos For ' + text + ' Here ')

		$text_div.append($img_div).append($inner_para)
		$main_div.append($para_div).append($text_div)
		$li = $('<li></li>')
		$li.addClass("li-to-do")
		$li.append($main_div)
		return ($li)
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
		var id_part = text.split("-")
		return (id_part[id_part.length - 1])
	}

	function getSection(text){
		var section_part = text.split("-")
		return (section_part[section_part.length - 2])
	}

	function checkDuplicate(element,text){
		var names_present = element.find('ul').children().text().split(" ").toString()
		if(names_present.match(text)) return false
		else return true
	}	

	$('ul.added_emp').delegate("li.ui-draggable","hover", function(event) {
		$(this).find('img').toggle (event.type === "mouseenter")
	}) 
	
	$('.image-added').click(function(){
		$(this).attr("src",$(this).attr("src") == add ? minus : add)
		$(this).parent().children().eq(1).slideToggle('slow')
	})

	$('img.remove-added').live("click",function() {
		$parent_id = $(this).parent().attr("id")
		console.log($parent_id)
		if(confirm("Do You Want to Delete This Row??")){
			$(this).parent().remove()
			$section = getSection($parent_id) /* To determine whether the to-do section is in Adnroid, ROR or somewhere else */
			$id = getId($parent_id) /* Get the appended count or id number which would select the particular to-do element */
			$('#to-do-'+$section+"-"+$id).remove()
			count--
		}
	})
})
