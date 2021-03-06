    /* Selecting All the elements of Divs belonging to module class*/
    var count = 0;
    $(document).ready(function(){
    $divs = $("div.module");    

    /* Excercise 2.1.2 */
    /*"Come up with three selectors that you could use to get the third item in the #myList unordered list. Which is the best to use? Why?"*/
    $("ul#myList").children().eq(2)
    $('#myList').children().filter(":even").eq(1)
    $('li#myListItem')
    /*"Out of the three methods given above, the last method is slowest while the first one is fastest"*/
    
    /*"Excercise 2.1.3"*/
    /*"Select the label for the search input using an attribute selector"*/
    $('label[for="q"]')

   /*"Excercise 2.1.4"*/
   /*"Figure out how many elements on the page are hidden"*/
   $(document).find("body").find(":hidden").length // Hidden inside body
   $(document).find(":hidden").length  //hidden throughout page


   /*"Excercise 2.1.5"*/
   /*"Figure out how many image elements on the page have an alt attribute." */
   $('img[alt]').length
 
   /*"Excercise 2.1.6"*/
   /*"Select all of the odd table rows in the table body."*/
   $('table').find('tr:odd')
   

}); 



