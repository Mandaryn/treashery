var map;
var geocoder;
var idleEventSet = false;
var markersArray = [];
var smallMarkersArray = [];
$(document).ready(function initialize() {
  showMap();
  addSmallMarkers();
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

function splitBounds() { // Funkcja zwraca boundsy i typ wyswietlanych markerow
  var bounds = map.getBounds();
  var northEast = bounds.getNorthEast();
  var southWest = bounds.getSouthWest();
  var neLat = northEast.lat();
  var neLng = northEast.lng();
  var swLat = southWest.lat();
  var swLng = southWest.lng();
  var type = $('#type').attr('data-type');
  return { swLat: swLat, swLng: swLng, neLat: neLat, neLng: neLng, type: type };
};

function addSpot() {
  google.maps.event.addListener(map, 'rightclick', function(event) {;
    var link = '<a href="/spots/new?lat='+event.latLng.lat()+'&lng='+event.latLng.lng()+'">Add spot at this location</a>';
    var infoWindow = new google.maps.InfoWindow({
      content: link,
      position: event.latLng
    });
    infoWindow.open(map);
  });
};