$('document').ready(function(){

  $('textarea').keydown(false)

  $('.caps-button').toggle(
    function() { $(this).css('background', 'red'); adjust_letters(); },
    function() { $(this).css('background', 'white'); adjust_letters(); }
  )

  function adjust_letters(){
    if( $('.letter .off').is(':hidden')){ 
      $('.letter .on').hide(); 
      $('.letter .off').show()
    }else{
      $('.letter .off').hide(); 
      $('.letter .on').show()
    }
  }

  $('.shift-button').toggle(
    function() { $('.shift-button').css('background', 'red'); adjust_symbols(); adjust_letters() }, 
    function() { $('.shift-button').css('background', 'white'); adjust_symbols(); adjust_letters() }
  )

  function adjust_symbols(){
    if( $('.symbol .off').is(":hidden") ){  
      $('.symbol .on').hide(); 
      $('.symbol .off').show() } 
    else {
      $('.symbol .off').hide(); 
      $('.symbol .on').show() 
    }
  }

  $('li').click(function(){
    var str = $('.screen').html() + $(this).find(":visible").text()
    $('.screen').html(str)
  })

  $('.tab-button').click(function(){
    var str = $('.screen').html() + "\t"
    $('.screen').html(str)
  })

  $('.enter-button').click(function(){
    var str = $('.screen').html() + "\n"
    $('.screen').html(str)
  })

  $('.delete-button').click(function(){
    var str = $('.screen').html()
    var len = str.length
    str = str.substr(0, len-1)
    $('.screen').html(str)
  })

  $('li').hover(
    function () { 
      modify_width(this, -4)
      modify_height(this, -4)
      },
    function() {
      modify_width(this, 4)
      modify_height(this, 4)
     }
  )

  function modify_height(t, number){
    var height = $(t).css('height');
    var margin_left = $(t).css('margin-top')
    var margin_right = $(t).css('margin-bottom')
    $(t).css('height', parseInt(height) + number)
    $(t).css('margin-top', parseInt(margin_left) + (number/2)*(-1))
    $(t).css('margin-bottom', parseInt(margin_right) + (number/2)*(-1))
  }

  function modify_width(t, number){
    var width = $(t).css('width');
    var margin_left = $(t).css('margin-left')
    var margin_right = $(t).css('margin-right')
    $(t).css('width', parseInt(width) + number)
    $(t).css('margin-left', parseInt(margin_left) + (number/2)*(-1))
    $(t).css('margin-right', parseInt(margin_right) + (number/2)*(-1))
  }

})
