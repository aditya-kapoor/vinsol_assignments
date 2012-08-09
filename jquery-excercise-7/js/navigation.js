$('document').ready(function(){
  	$list = $('ul#nav')
  	$list.children().each(function(index){  
	  	$list.children().eq(index).hover(
	  		function(){ $(this).find('ul').addClass("hover") }, 
			function(){ $(this).find('ul').removeClass("hover") }
			)  
	 	})
 });
