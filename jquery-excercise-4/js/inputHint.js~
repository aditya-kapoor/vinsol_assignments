$(document).ready(function(){
  /*"Excercise 4.1.1"*/
  /*"Set the value of the search input to the text of the label element"*/
  $form = $('form#search')
  $label = $form.find('label')
  $search_text = $label.text();
  $text_field = $label.next() // $text_field = $form.find('input[name="q"]')
  $text_field.attr("value",$search_text)
  $label.next()

  /*"Excercise 4.1.2"*/
  /*"Adding a class of 'hint' to the search input"*/
  $text_field.addClass("hint")
  $label.next()

  /*"Excercise 4.1.3"*/
  /*"Remove the label element"*/
  $label.remove();

  /*"Excercise 4.1.4"*/
  /*"Adding Focus Event to the text field"*/
  $text_field.focus(function(){   $text_field.val("") })

  /*"Excercise 4.1.5"*/
  /*"Adding blur event to the text field" */
  $text_field.blur(function(){   $text_field.val($search_text) })

});
