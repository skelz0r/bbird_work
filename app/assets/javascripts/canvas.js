$('.edit_block').children('textarea').on('focusout', function(){
  block_id=$(this).parent().attr('id');
  document.getElementById(block_id).submit();
});

