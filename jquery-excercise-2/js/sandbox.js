$(document).ready(function(){
   console.log("Excercise 2.2.1")
   console.log("Select all of the image elements on the page; log each image's alt attribute.")
   $('img').each(function(index,element){ 
   console.log($(element).attr("alt")) 
   });
   console.log("Excercise 2.2.2")
   console.log("Select the search input text box, then traverse up to the form and add a class to the form.")
 $('input.input_text').parent().attr("class","form-class")
 console.log($('input.input_text')) 

   console.log("Excercise 2.2.3")
   console.log("Select the list item inside #myList that has a class of 'current' and remove that class from it; add a class of 'current' to the next list item.")
   var selectedItem = $('#myList').find('.current')
   var nextItem = selectedItem.next()
   selectedItem.remove()
   nextItem.attr("class","current")
   console.log(nextItem)

   console.log("Excercise 2.2.4")
   console.log("Select the select element inside #specials; traverse your way to the submit button");
   start = $('#specials').children().eq(0)
   form = start.siblings().eq(1)
   submit = form.children().find(".buttons").children().eq(0)
   console.log(submit)

  console.log("Excercise 2.2.5")
  console.log("Select the first list item in the #slideshow element; add the class 'current' to it, and then add a class of 'disabled' to its sibling elements.")
  var firstElement = $('#slideshow').children().eq(0)
  var siblings = firstElement.siblings()
  firstElement.attr("class","current")
  siblings.each(function(index,element){ $(element).attr("class","disabled") })
  console.log($('#slideshow'))


});
