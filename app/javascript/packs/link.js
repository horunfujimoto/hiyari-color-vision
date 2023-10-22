/* global location $*/
$(function(){
  $('tr[data-href]').on('click', function(){
    location.href = $(this).data('href');
  });
});