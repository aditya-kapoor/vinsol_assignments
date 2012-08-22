$('document').ready(function(){
  $ul = $('div#blog').children().eq(1)
  $ul_children = $ul.children()
  $ul_children.each(function(index){
  var $div = $('<div>Testing Text</div>')
  $div.insertAfter($(this).find('h3')) 
  $(this).find('h3').click(function(event) {
    event.preventDefault();
		$link = $(this).find('a')
    var data = $link.attr('href');  
    $link.data('href',data) 
    var url_data = $link.data('href') 				 // extracting the href data out of the link
    var url = "data/" + url_data      				 // Making the URL for the fetching of the data
    var parts = url.split("#")        
    var final_url = parts[0] + " #" + parts[1] // Adding a Space between link and #
    $(this).next('div').load(final_url);       // Perform the final load operation
    //console.log($(this).next('div').text());
     })
   });
})
