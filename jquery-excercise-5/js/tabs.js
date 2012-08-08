  $('document').ready(function(){
    console.log("Hide all of the modules.")
    $module = $('.module')
    $('.module').hide()

    console.log("Create an unordered list element before the first module.")
    $list = $('<ul></ul>')
    $list.insertBefore($module.eq(0))

    console.log("Iterate over the modules using $.fn.each. For each module, use the text of the h2 element as the text for a list item that you add to the unordered list element.")
    $module.each(function(index){
	$li = $('<li></li>')
	var text = $module.eq(index).find('h2').text()
	$li.text(text)
	$list.append($li)
 });

     console.log("Binding Events")
     $list.children().each(function(index){ 
	$(this).bind('click',function(){
	   $(this).addClass("current")
	   $(this).siblings().attr("class","")
	   var $id = 'div#'+$(this).text().toLowerCase();
	   var $sibling_id = 'div#' + $(this).siblings().text().toLowerCase();
           console.log($sibling_id)
	   $($sibling_id).hide()
	   $($id).show()
	});
      console.log("Showing the First Block")
      $list.children(':first-child').addClass("current")
      $('div#blog').show()
     });    
  });
