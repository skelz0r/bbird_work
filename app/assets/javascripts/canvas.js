var lion=false;

function textarea_pop()
{
  $("#text").fadeIn();
  lion=true;
}

$('td').click(function() {
 if ( !lion ){
  $("#text").fadeOut();
 }
 else
   lion=false;
  });

console.log(lion);