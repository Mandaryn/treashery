$(document).ready(function initialize() {
    var latlng = new google.maps.LatLng(51.994649, 19.039774); 
    var myOptions = {
      zoom: 6,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("google_map"),myOptions);
		}
);
  