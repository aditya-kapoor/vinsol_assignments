$(document).ready(function(){

  console.log("Excercise 2.3.1")
  console.log("Add five new list items to the end of the unordered list #myList.")
  var list = $('#myList') 
  for(i=0;i<5;++i)
    list.append("<li> Appended List Items </li>") 
  console.log($('#myList'))

  console.log("Excercise 2.3.2")
  console.log("Remove the odd list items")
  list = $('#myList')
  list.children().filter(":odd").remove()
  console.log(list)

  console.log("Excercise 2.3.3")
  console.log("Add another h2 and another paragraph to the last div.module")
  var last = $('div.module').eq(-1)
  last.append("<h2> This is an added h2 tag </h2>")
  last.append("<p> This is an added paragraph text </p>")
  console.log(last)
  console.log($('div.module'))
  
  console.log("Excercise 2.3.4")
  console.log("Add another option to the select element; give the option the value 'Wednesday'")
  var $select = $('select[name="day"]')
  var $tuesday = $select.children().eq(2)
  var $option = $('<option value="wednesday">Wednesday</option>')
  $option.insertAfter($tuesday)
  console.log($('select[name="day"]').children())

  console.log("Excercise 2.3.5") 
  console.log("Add a new div.module to the page after the last one; put a copy of one of the existing images inside of it.")
  var divs = $('div.module')
  var div_to_be_added = "<div class='module'><img src='images/fruit.jpg' /></div>"
  var lastChild = divs.eq(-1);
  lastChild.append(div_to_be_added)
  console.log($('div.module'))

});

