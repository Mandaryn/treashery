$('a.set_type').live('click', function(event) {
  event.preventDefault();
  deleteSmallMarkers();
  addSmallMarkers($(this).attr('data-type'));
  $('#type').attr('data-type', $(this).attr('data-type'));
  $.get('/spots', splitBounds(), function() {}, 'script');
});