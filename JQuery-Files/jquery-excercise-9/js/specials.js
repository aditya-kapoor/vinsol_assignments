 $('document').ready(function(){
    var json_data;
    $specials = $('div#specials')
    $form = $specials.find('form')
    $select = $form.find('select')
    $target_div = $('<div></div>')
    $target_div.insertAfter($select)
    $select.one('change',function(){
       var select_value = $(this)
       $specials.find('li').eq(1).remove()
       $.getJSON('data/specials.json', function(data){
          json_data = data
          generateHTML(select_value)
      })

     function generateHTML(data){
        $title = $('<h2></h2>')
        $title.append(json_data[data.val()].title)
        $img = $('<img />')
        $img.attr("src",json_data[data.val()].image)
        $text_para = $('<p></p>')
        $text_para.append(json_data[data.val()].text)
        $target_div.append($title).append($img).append($text_para)
        $target_div.css("color",json_data[data.val()].color) 
       }

   $select.change(function() {
      $target_div.html(" ")
      generateHTML($(this))
      }) 
   })
})