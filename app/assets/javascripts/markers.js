function addAllMarkers() {
  $("div.spot").each(function(index, element) {
    var lat = parseFloat($(element).find("div.latitude").text());
    var lng = parseFloat($(element).find("div.longitude").text());
    var name = $.trim($(element).find("a.fn.url").text());
    var type = $.trim($(element).find("div.type").text());
    addMarker(lat, lng, name, type);
  });
};

function addMarker(lat, lng, name, type) {
  var spot = new google.maps.LatLng(lat,lng);

  switch (type) {
    case 'medical':
      var image = new google.maps.MarkerImage('images/icons.png',
        new google.maps.Size(20, 34),
        new google.maps.Point(0,0),
        new google.maps.Point(10, 34)
      );

      var shadow = new google.maps.MarkerImage('images/icons.png',
        new google.maps.Size(37, 34),
        new google.maps.Point(20,0),
        new google.maps.Point(10, 34)
      );

      var markerOptions = {
        position: spot,
        map: map,
        title: name,
        icon: image,
        shadow: shadow,
        zIndex: 1
      };
      break;
    case 'electronic':
      var image = new google.maps.MarkerImage('images/icons.png',
        new google.maps.Size(20, 34),
        new google.maps.Point(0,34),
        new google.maps.Point(10, 34)
      );

      var shadow = new google.maps.MarkerImage('images/icons.png',
        new google.maps.Size(37, 34),
        new google.maps.Point(20,34),
        new google.maps.Point(10, 34)
      );

      var markerOptions = {
        position: spot,
        map: map,
        title: name,
        icon: image,
        shadow: shadow,
        zIndex: 1
      };
      break;
    case 'animal_prod':
      var image = new google.maps.MarkerImage('images/icons.png',
        new google.maps.Size(20, 34),
        new google.maps.Point(0,68),
        new google.maps.Point(10, 34)
      );

      var shadow = new google.maps.MarkerImage('images/icons.png',
        new google.maps.Size(37, 34),
        new google.maps.Point(20,68),
        new google.maps.Point(10, 34)
      );

      var markerOptions = {
        position: spot,
        map: map,
        title: name,
        icon: image,
        shadow: shadow,
        zIndex: 1
      };
      break;
    case 'radioactive':
      var image = new google.maps.MarkerImage('images/icons.png',
        new google.maps.Size(20, 34),
        new google.maps.Point(0,102),
        new google.maps.Point(10, 34)
      );

      var shadow = new google.maps.MarkerImage('images/icons.png',
        new google.maps.Size(37, 34),
        new google.maps.Point(20,102),
        new google.maps.Point(10, 34)
      );

      var markerOptions = {
        position: spot,
        map: map,
        title: name,
        icon: image,
        shadow: shadow,
        zIndex: 1
      };
      break;
    case 'food':
      var image = new google.maps.MarkerImage('images/icons.png',
        new google.maps.Size(20, 34),
        new google.maps.Point(0,136),
        new google.maps.Point(10, 34)
      );

      var shadow = new google.maps.MarkerImage('images/icons.png',
        new google.maps.Size(37, 34),
        new google.maps.Point(20,136),
        new google.maps.Point(10, 34)
      );

      var markerOptions = {
        position: spot,
        map: map,
        title: name,
        icon: image,
        shadow: shadow,
        zIndex: 1
      };
      break;
    case 'other':
      var image = new google.maps.MarkerImage('images/icons.png',
        new google.maps.Size(20, 34),
        new google.maps.Point(0, 170),
        new google.maps.Point(10, 34)
      );

      var shadow = new google.maps.MarkerImage('images/icons.png',
        new google.maps.Size(37, 34),
        new google.maps.Point(20,170),
        new google.maps.Point(10, 34)
      );

      var markerOptions = {
        position: spot,
        map: map,
        title: name,
        icon: image,
        shadow: shadow,
        zIndex: 1
      };
      break;
    default:
      var markerOptions = {
          position: spot,
          map: map,
          title: name,
          zIndex: 1
      };
  }
  var marker = new google.maps.Marker(markerOptions);
  markersArray.push(marker);
};

function reloadMarkers() {
  $.get('/spots', splitBounds(), function() {}, 'script');

};

function deleteMarkers() {
  if (markersArray) {
    for (i in markersArray) {
      markersArray[i].setMap(null);
    }
    markersArray.length = 0;
  }
};