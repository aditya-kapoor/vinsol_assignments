$('document').ready(function(){
  translated_json = []
  // link = "http://translate.google.com/translate_a/t?client=t&text=hello&hl=en&sl=en&tl=hi&ie=UTF-8&oe=UTF-8&multires=1&prev=conf&psl=hi&ptl=hi&otf=1&it=sel.4720&ssel=6&tsel=3&sc=1"
  $('#input-text').bind("blur", function(){
    get_translated_text($(this).val())
  })

  // set_cookies()

  // function set_cookies() {
  //   $.ajax({
  //     url: "http://translate.google.com/translate/static/d9oE-AuQSi0/js/desktop_module_async.js"
  //   })
  //   $.ajax({
  //     url: "http://translate.google.com/translate/static/zfX4QfqxkoM/js/desktop_module_lazy.js"
  //   })
  //   $.ajax({
  //     url: "http://translate.google.com/translate/static/zfX4QfqxkoM/js/desktop_module_lazy.js"
  //   })
  // }

  function get_translated_text(text){
    $.ajax({
      url:"http://mymemory.translated.net/api/get?q="+text+"&langpair=en|hi",
      // url:"http://translate.google.com/translate_a/t?client=t&text=nishant&hl=en&sl=en&tl=hi&ie=UTF-8&oe=UTF-8&multires=1&ssel=0&tsel=0&sc=1",
      dataType: "json",
      success: function(data, status, jqXHR){
        translated_json = data
        fill_results()
      }
    })
    // alert(text)
  }

  function fill_results() {
    $('#translated-text').val(translated_json['matches'][0]['translation'])
  }
})
