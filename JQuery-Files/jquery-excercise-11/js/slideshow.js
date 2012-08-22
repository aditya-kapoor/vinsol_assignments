$('document').ready(function () {
    $slideshow = $('#slideshow')
    $body = $('body')
    $body.prepend($slideshow)
    generateNavigationBox()

    function setTotalSlides(){
        $children = $slideshow.children()
        $('input#nav-slide-total').val($children.length)
    }

    function setCurrentSlide(active_image){
        $index = (active_image.index() + 1) % 3
        $('input#nav-slide').val($index)        
    }

    function GenerateSlideShow() {
        $active_image = $slideshow.find(".active")
        setCurrentSlide($active_image)
        setTotalSlides()
        $active_image.show(1000).fadeOut(1000, function () {
            if ($active_image.next().length == 0) {
                $children.eq(0).addClass("active")
                $children.eq(0).fadeIn(1000)
            } else { 
                $active_image.next().addClass("active")
                $active_image.next().fadeIn(1000)
            }
        })
        $active_image.removeClass("active")
    }

    function generateNavigationBox(){

        $nav = $('<div></div>')
        $nav.attr("id","navigation-slideshow")
        $table = $('<table></table>')

        $tr = $('<tr></tr>')
        $currentSlide_td = $('<td></td>')
        $currentSlide_td.append("Current Slide")
        
        $input_td = $('<td></td>')
        $nav_slide = $('<input>')
        $nav_slide.attr({type:"text",id:"nav-slide",readonly:"readonly"})
        $input_td.append($nav_slide)
        
        $tr.append($currentSlide_td).append($input_td)

        $next_tr = $('<tr></tr>')
        $totalSlide_td = $('<td></td>')
        $totalSlide_td.append("Total Slides")
        
        $total_input_td = $('<td></td>')
        
        $total_slide = $('<input>')
        $total_slide.attr({type:"text",id:"nav-slide-total",readonly:"readonly"})
        
        $total_input_td.append($total_slide)
        $next_tr.append($totalSlide_td).append($total_input_td)

        $nav.append($tr).append($next_tr)

        $nav.insertAfter($slideshow)
        $slideshow.children().eq(0).addClass("active")
        $slideshow.children().eq(0).siblings().hide()
    }
    
    $(function () {
        setInterval(function () {
            GenerateSlideShow()
        }, 3500)
    })
})
