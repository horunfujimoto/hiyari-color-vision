/* global location $*/
$(document).on('turbolinks:load', function() {
  $(function(){
    $('tr[data-href]').on('click', function(){
      location.href = $(this).data('href');
    });
  });
});