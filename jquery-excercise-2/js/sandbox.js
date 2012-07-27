$(document).ready(function(){
   /*"Excercise 2.2.1"*/
   /*"Select all of the image elements on the page; log each image's alt attribute."*/
   $('img').each(function(index,element){ 
   console.log($(element).attr("alt")) 
   });

   /*"Excercise 2.2.2"*/
   /*"Select the search input text box, then traverse up to the form and add a class to the form." */
   $('input.input_text').parent().attr("class","form-class")
   $('input.input_text')

   /*"Excercise 2.2.3"*/
   /*"Select the list item inside #myList that has a class of 'current' and remove that class from it; add a class of 'current' to the next list item."*/
   var selectedItem = $('#myList').find('.current')
   var nextItem = selectedItem.next()
   selectedItem.remove()
   nextItem.attr("class","current")
   
   /*"Excercise 2.2.4"*/
   /*"Select the select element inside #specials; traverse your way to the submit button"*/
   start = $('#specials').children().eq(0)
   form = start.siblings().eq(1)
   submit = form.children().find(".buttons").children().eq(0)

  /*"Excercise 2.2.5"*/
  /*"Select the first list item in the #slideshow element; add the class 'current' to it, and then add a class of 'disabled' to its sibling elements."*/
  var firstElement = $('#slideshow').children().eq(0)
  var siblings = firstElement.siblings()
  firstElement.attr("class","current")
  siblings.each(function(index,element){ $(element).attr("class","disabled") })


});
