var map;
var geocoder;
var idleEventSet = false;
var markersArray = [];
$(document).ready(function initialize() {
  showMap();
  addAllMarkers();
});

function showMap() {
  geocoder = new google.maps.Geocoder();
  var latlng = new google.maps.LatLng(51.994649, 19.039774); 
  var myOptions = {
    zoom: 6,
    center: latlng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById("google_map"),myOptions);   
  addSpot();
  google.maps.event.addListener(map, 'tilesloaded', function() {
    if(!idleEventSet) {
      idleEventSet = true
      google.maps.event.addListener(map, 'idle', reloadMarkers);
    }
  });
};

function addAllMarkers() {
  $("div.spot").each(function(index, element) {
    var lat = parseFloat($(element).find("div.latitude").text());
    var lng = parseFloat($(element).find("div.longitude").text());
    var name = $(element).find("a.fn.url").text();
    addMarker(lat, lng, name);
  });
};

function addMarker(lat, lng, name) {
  var spot = new google.maps.LatLng(lat,lng);
  var markerOptions = {
    position: spot,
    map: map,
    title: name
  };
  var marker = new google.maps.Marker(markerOptions);
  markersArray.push(marker);
};

function reloadMarkers() {
  $.get('/spots', splitBounds(), function() {}, 'script');
};

function splitBounds() {
  var bounds = map.getBounds();
  var northEast = bounds.getNorthEast();
  var southWest = bounds.getSouthWest();
  var neLat = northEast.lat();
  var neLng = northEast.lng();
  var swLat = southWest.lat();
  var swLng = southWest.lng();
  return { swLat: swLat, swLng: swLng, neLat: neLat, neLng: neLng };
};

function deleteMarkers() {
  if (markersArray) {
    for (i in markersArray) {
      markersArray[i].setMap(null);
    }
    markersArray.length = 0;
  }
};

function addSpot() {
  google.maps.event.addListener(map, 'click', function(event) {;
    var link = '<a href="/spots/new?lat='+event.latLng.lat()+'&lng='+event.latLng.lng()+'">Add spot at this location</a>';
    var infoWindow = new google.maps.InfoWindow({
      content: link,
      position: event.latLng
    });    
    infoWindow.open(map);    
  });      
};