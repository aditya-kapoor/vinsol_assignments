$('document').ready(function(){
  $slideshow = $('#slideshow')
  $body = $('body')
  $body.prepend($slideshow)
  $nav = $('<div id="navigation-slideshow"><table><tr><td>Current Slide</td><td><input type="text" id="nav-slide" readonly></td></tr><tr><td>Total Slide </td><td><input type="text" id="nav-slide-total" readonly /></td></tr></div>')
  $nav.insertAfter($slideshow)
  $slideshow.children().eq(0).addClass("active")
  $slideshow.children().eq(0).siblings().attr("style","display:none")  

function GenerateSlideShow(){
$children = $slideshow.children()
$('input#nav-slide-total').val($children.length)
$active_image = $slideshow.find(".active")
console.log($active_image.index())
$index = ($active_image.index() + 1 ) % 3
$('input#nav-slide').val($index)



$active_image.fadeIn(1000).show(1500).fadeOut(1000,function(){
		if($active_image.next().length == 0)
		$children.eq(0).attr("style","display:block")
		else  
		$active_image.next().attr("style","display:block")
})
if($active_image.next().length ==0) 
  $children.eq(0).addClass("active")
else
  $active_image.next().addClass("active") 
$active_image.removeClass("active")
}

$(function() { setInterval(function() { GenerateSlideShow() },4000) }) 
})
