$('a.get_address').live('click', function(event) {
  event.preventDefault();
  var location = new google.maps.LatLng(parseFloat($('#spot_lat').val()), parseFloat($('#spot_lng').val()));
  geocoder.geocode({'latLng': location}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      if (results[0]) {
        $('#spot_address').val(results[0].formatted_address)
        return
      }
    } else {
      alert("Geocoder failed due to: " + status);
    }
  });
});