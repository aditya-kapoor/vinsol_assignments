/* Selecting All the elements of Divs belonging to module class*/
var count = 0;
$(document).ready(function(){
    $divs = $("div.module");
    console.log("Excercise2.1.1")
    console.log($divs);
    

    console.log("Excercise 2.1.2")
    console.log("Come up with three selectors that you could use to get the third item in the #myList unordered list. Which is the best to use? Why?")
    console.log($("ul#myList").children().eq(2))
    console.log($("div#main #myList").children().eq(2))
    console.log($("#myList").children().eq(2))
    console.log("Out of the three methods given above, the last method is slowest while the first one is fastest");
    
    console.log("Excercise 2.1.3")
    console.log("Select the label for the search input using an attribute selector");
    console.log($('label[for="q"]'))

   console.log("Excercise 2.1.4")
   console.log("Figure out how many elements on the page are hidden")
   console.log("The following are hidden in the body")
   console.log($(document).find("body").find(":hidden").length)
   console.log("The following elements are hidden inside and outside body")
   console.log($(document).find(":hidden").length)


   console.log("Excercise 2.1.5")
   console.log("Figure out how many image elements on the page have an alt attribute.")
   $('img').each(function(index,element){  
       if($(element).attr("alt").length != 0) count++;
    });
   console.log(count);
 
   console.log("Excercise 2.1.6")
   console.log("Select all of the odd table rows in the table body.")
   console.log($('table').find('tr').filter(":odd").length)
}); 



