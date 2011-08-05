$('a.spot_type').live('click', function(event) {  
  event.preventDefault();
  
  $('a.spot_type').removeClass('selected');
  $(this).addClass('selected');
  
  deleteSmallMarkers();
  
  addSmallMarkers($(this).attr('data-type'));
  $('#type').attr('data-type', $(this).attr('data-type'));
  $.get('/spots', splitBounds(), function() {}, 'script');
});