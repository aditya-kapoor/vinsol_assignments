$(document).ready(function(){

  /*"Excercise 2.3.1"*/
  /*"Add five new list items to the end of the unordered list #myList."*/
  var list = $('#myList') 
   for(var i=0;i<=5;++i)
   $('#myList :last-child').after("<li> Appended List Items </li>")
 
  /*"Excercise 2.3.2"*/
  /*"Remove the odd list items"*/
  $('#myList :odd').remove()
  
  /*"Excercise 2.3.3"*/
  /*"Add another h2 and another paragraph to the last div.module"*/
  var last_module = $('div.module').eq(-1)
  last_module.append("<h2> This is an added h2 tag </h2>")
  last_module.append("<p> This is an added paragraph text </p>")
  /*"Excercise 2.3.4"*/
  /*"Add another option to the select element; give the option the value 'Wednesday'"*/
  $('select[name="day"]').find("option[value='tuesday']").after("<option value='wednesday'>Wednesday</option>")

  /*"Excercise 2.3.5") */
  /*"Add a new div.module to the page after the last one; put a copy of one of the existing images inside of it."*/
  var div_to_be_added = "<div class='module'><img src='images/fruit.jpg' /></div>"
  $('div.module').eq(-1).after(div_to_be_added)
});

