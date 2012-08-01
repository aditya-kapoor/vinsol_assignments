$(document).ready(function(){
   /*"Excercise 2.2.1"*/
   /*"Select all of the image elements on the page; log each image's alt attribute."*/
   $('img').each(function(index,element){ 
   console.log($(element).attr("alt")) 
   });

   /*"Excercise 2.2.2"*/
   /*"Select the search input text box, then traverse up to the form and add a class to the form." */
   $('input.input_text').parent().addClass("form-class")
   

   /*"Excercise 2.2.3"*/
   /*"Select the list item inside #myList that has a class of 'current' and remove that class from it; add a class of 'current' to the next list item."*/
   var selectedItem = $('#myList .current')
   selectedItem.next().addClass("current")
   selectedItem.remove()
   
   /*"Excercise 2.2.4"*/
   /*"Select the select element inside #specials; traverse your way to the submit button"*/
   start = $('#specials form select')
   end = $('#specials form .buttons')
   
  /*"Excercise 2.2.5"*/
  /*"Select the first list item in the #slideshow element; add the class 'current' to it, and then add a class of 'disabled' to its sibling elements."*/
  $('#slideshow :first-child').eq(0).addClass("current")
  $('#slideshow :first-child').eq(0).siblings().addClass("disabled")


});
