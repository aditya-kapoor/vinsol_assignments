$(document).ready(function(){
  console.log("Excercise 4.1.1")
  console.log("Set the value of the search input to the text of the label element")
  $form = $('form#search')
  $label = $form.find('label')
  $search_text = $label.text();
  $text_field = $label.next() // $text_field = $form.find('input[name="q"]')
  $text_field.attr("value",$search_text)
  console.log($label.next())

  console.log("Excercise 4.1.2")
  console.log("Adding a class of 'hint' to the search input")
  $text_field.addClass("hint")
  console.log($label.next())

  console.log("Excercise 4.1.3")
  console.log("Remove the label element");
  $label.remove();

  console.log("Excercise 4.1.4")
  console.log("Adding Focus Event to the text field")
  $text_field.focus(function(){   $text_field.val("") })

  console.log("Excercise 4.1.5")
  console.log("Adding blur event to the text field")
  $text_field.blur(function(){   $text_field.val($search_text) })

});