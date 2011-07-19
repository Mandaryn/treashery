$(document).ready(function initialize() {
	var map;
	showMap();
	addAllMarkers();
});

function showMap() {
	  var latlng = new google.maps.LatLng(51.994649, 19.039774); 
    var myOptions = {
      zoom: 6,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
  	map = new google.maps.Map(document.getElementById("google_map"),myOptions);
}

function addAllMarkers() {
	$("div.spot").each(function(index, element) {
		var lat = parseFloat($(element).find("div.latitude").text());
		var lng = parseFloat($(element).find("div.longitude").text());
		var name = $(element).find("a.fn.url").text();
			addMarker(lat, lng, name);
	});
}

function addMarker(lat, lng, name) {
	var spot = new google.maps.LatLng(lat,lng);
  var markerOptions = {
    position: spot,
    map: map,
    title: name
  }
  var marker = new google.maps.Marker(markerOptions);
}