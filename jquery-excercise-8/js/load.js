$('document').ready(function(){
  $blog = $('div#blog')
  $ul = $blog.children().eq(1)
  $ul_children = $ul.children()
  $ul_children.each(function(index){
  var $div = $('<div>Testing Text</div>')
  $div.insertAfter($(this).find('h3')) 
  $(this).find('h3').click(function(event) {
    event.preventDefault();
    var data = $(this).find('a').attr('href');
    $(this).find('a').data('href',data)
    var url_data = $(this).find('a').data('href')
    var url = "data/" + url_data
    var parts = url.split("#")
    var final_url = parts[0] + " #" + parts[1]
    $(this).next('div').load(final_url);
    //console.log($(this).next('div').text());
     })
   });
})
