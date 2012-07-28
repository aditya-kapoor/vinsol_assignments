 $('document').ready(function(){
   var json_data;
  $specials = $('div#specials')
  $form = $specials.find('form')
  $select = $form.find('select')
  $div = $('<div>testing text</div>')
  $div.insertAfter($select)
  $select.one('change',function(){
     var x = $(this).val()
     $specials.find('li').eq(1).hide()
     $.getJSON('data/specials.json', function(data){
     json_data = data
     str = json_data[x].title + "<br />" + json_data[x].text + "<br />" + json_data[x].image + "<br />" + json_data[x].color;
     $div.html(" ")
     $div.html(str)
})
   $select.change(function() {
   str = json_data[$(this).val()].title + "<br />" + json_data[$(this).val()].text + "<br />" + json_data[$(this).val()].image + "<br />" + json_data[$(this).val()].color;
     $div.html(" ")
     $div.html(str)
      }) 
   })
})
