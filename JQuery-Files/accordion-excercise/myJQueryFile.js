function generateDynamicIDs(){
	$li = $('li:not(:has(ul))')
	count = 0
	$li.each(function(index){
	$(this).attr("id",count)
	$(this).find('a').attr("href","allornone.html?"+count)
	count++;
	})
}
