$('a.set_type').live('click', function(event) {
  event.preventDefault();
  deleteSmallMarkers();
  $.get('/spots', addSmallMarkers(), function() {}, 'script');

});
  