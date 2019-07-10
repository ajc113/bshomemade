/* ==============================================
GOOGLE MAP
=============================================== */

	jQuery(document).ready(function() {

			'use strict';

			// Map Coordination

			var latlng = new google.maps.LatLng(42.090860, -70.707060);

			// Map Options
			var myOptions = {
				zoom: 18,
				center: latlng,
				mapTypeId: google.maps.MapTypeId.ROADMAP,
				disableDefaultUI: true,
				scrollwheel: true,
				// Google Map Color Styles
				styles: [{featureType:"landscape",stylers:[{saturation:-100},{lightness:65},{visibility:"on"}]},{featureType:"poi",stylers:[{saturation:-100},{lightness:51},{visibility:"simplified"}]},{featureType:"road.highway",stylers:[{saturation:-100},
				{visibility:"simplified"}]},{featureType:"road.arterial",stylers:[{saturation:-100},{lightness:30},{visibility:"on"}]},{featureType:"road.local",stylers:[{saturation:-100},{lightness:40},{visibility:"on"}]},{featureType:"transit",stylers:[{saturation:-100},
				{visibility:"simplified"}]},{featureType:"administrative.province",stylers:[{visibility:"off"}]/**/},{featureType:"administrative.locality",stylers:[{visibility:"off"}]},{featureType:"administrative.neighborhood",stylers:[{visibility:"on"}
				]/**/},{featureType:"water",elementType:"labels",stylers:[{visibility:"on"},{lightness:-25},{saturation:-100}]},{featureType:"water",elementType:"geometry",stylers:[{hue:"#ffff00"},{lightness:-25},{saturation:-97}]}]
			};

			var map = new google.maps.Map(document.getElementById('google-map'), myOptions);

			// Marker Image
			var image = 'images/marker.png';
			
		  	/* ========= First Marker ========= */

		  	// First Marker Coordination
			
			var myLatlng = new google.maps.LatLng(42.091104, -70.707021);

			// Your Texts 

			 var contentString = '<div id="content">'+
			  '<div id="siteNotice">'+
			  '</div>'+
			  '<h4>' +

			  'Bs Ice Cream'+

			  '</h4>'+
			  '<p>' +

			  '57 Snow Road, Marshfield, 02050' +

			  '</p>'+
			  '</div>';
				

			var marker = new google.maps.Marker({
				  position: myLatlng,
				  map: map,
				  title: 'Bs Ice Cream',
				  icon: image
			  });


			var infowindow = new google.maps.InfoWindow({
			  content: contentString
			  });

			  
			 google.maps.event.addListener(marker, 'click', function() {
				infowindow.open(map,marker);
			  });

			 /* ========= End First Marker ========= */
		
		});