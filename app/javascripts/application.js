$(document).ready(function(){
  $('#book-lookup-form').submit(function(event) {
    event.preventDefault();
    doBookLookup();
  });
  
  if ($('#book-lookup-form').length) {
    doBookLookup();
  };
  
  $('#book-lookup-results').selectable({
    filter: 'li.result',
    selected: function(event, ui) {
      var copy = function(index, field) {
        value = $(ui.selected).find('.'+field).html();
        $('#book_'+field).val(value);
      };
      $.each(['title', 'author', 'copyright', 'edition', 'publisher',
              'asin', 'isbn', 'cover_uri'], copy);
    }
  });
  
  $('form').submit(function(){
    $('input[type=submit]', this).attr('disabled', 'disabled');
  });
});

function doBookLookup() {
  $.ajax({
    type: "GET",
    url: "/books/lookup",
    data: ({query: $('#book-lookup-input').val()}),
    dataType: "script"
  });
}