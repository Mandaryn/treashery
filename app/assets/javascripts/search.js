jQuery(function($) {
  $("#searchForm")
    .bind("ajax:success", function(data, status, xhr) {
      var southwest = new google.maps.LatLng(parseFloat(status.geometry.viewport.southwest.lat), parseFloat(status.geometry.viewport.southwest.lng));
      var northeast = new google.maps.LatLng(parseFloat(status.geometry.viewport.northeast.lat), parseFloat(status.geometry.viewport.northeast.lng));
      var bounds = new google.maps.LatLngBounds(southwest, northeast);
      map.fitBounds(bounds);
    });
});
