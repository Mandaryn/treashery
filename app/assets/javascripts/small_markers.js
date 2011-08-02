function addSmallMarkers(type) {
  $.getJSON('/spots.json', { type: type }, function(spot) {
    $.each(spot, function(index, element) {
      var lat = parseFloat(element.location.lat);
      var lng = parseFloat(element.location.lng);

      addSmallMarker(lat, lng, element.name, element.type);
    });
  });
};

function addSmallMarker(lat, lng, name, type) {
  var spot = new google.maps.LatLng(lat,lng);

  switch (type) {
    case 'medical':
      var image = new google.maps.MarkerImage('images/small_icons.png',
        new google.maps.Size(10, 10),
        new google.maps.Point(0,0),
        new google.maps.Point(5, 5)
      );

      var markerOptions = {
        position: spot,
        map: map,
        title: name,
        icon: image,
        zIndex: 0
      };
      break;
    case 'electronic':
      var image = new google.maps.MarkerImage('images/small_icons.png',
        new google.maps.Size(10, 10),
        new google.maps.Point(0,10),
        new google.maps.Point(5, 5)
      );

      var markerOptions = {
        position: spot,
        map: map,
        title: name,
        icon: image,
        zIndex: 0
      };
      break;
    case 'animal_prod':
      var image = new google.maps.MarkerImage('images/small_icons.png',
        new google.maps.Size(10, 10),
        new google.maps.Point(0,20),
        new google.maps.Point(5, 5)
      );

      var markerOptions = {
        position: spot,
        map: map,
        title: name,
        icon: image,
        zIndex: 0
      };
      break;
    case 'radioactive':
      var image = new google.maps.MarkerImage('images/small_icons.png',
        new google.maps.Size(10, 10),
        new google.maps.Point(0,30),
        new google.maps.Point(5, 5)
      );

      var markerOptions = {
        position: spot,
        map: map,
        title: name,
        icon: image,
        zIndex: 0
      };
      break;
    case 'food':
      var image = new google.maps.MarkerImage('images/small_icons.png',
        new google.maps.Size(10, 10),
        new google.maps.Point(0,40),
        new google.maps.Point(5, 5)
      );

      var markerOptions = {
        position: spot,
        map: map,
        title: name,
        icon: image,
        zIndex: 0
      };
      break;
    case 'other':
      var image = new google.maps.MarkerImage('images/small_icons.png',
        new google.maps.Size(10, 10),
        new google.maps.Point(0, 50),
        new google.maps.Point(5, 5)
      );

      var markerOptions = {
        position: spot,
        map: map,
        title: name,
        icon: image,
        zIndex: 0
      };
      break;
    default:
      var image = new google.maps.MarkerImage('/images/kropka.png',
        new google.maps.Size(9, 9),
        new google.maps.Point(0, 0),
        new google.maps.Point(4, 4)
      );

      var markerOptions = {
        position: spot,
        map: map,
        title: name,
        icon: image,
        zIndex: 0
      };
  } 
  var marker = new google.maps.Marker(markerOptions);
  smallMarkersArray.push(marker);
};

function deleteSmallMarkers() {
  if (smallMarkersArray) {
    for (i in smallMarkersArray) {
      smallMarkersArray[i].setMap(null);
    }
    smallMarkersArray.length = 0;
  }
};