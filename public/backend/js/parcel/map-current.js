"use strict";

$(document).ready(function() {
    var geocoder;
    var map;
    var marker;

    function initAutocomplete() {
        if (mapLat !== '' && mapLong !== '') {
            getLocation(mapLat, mapLong);
        } else {
            getLocation(null, null);
        }

        var input = $('#autocomplete-input')[0];
        var autocomplete = new google.maps.places.Autocomplete(input);

        autocomplete.addListener('place_changed', function() {
            var place = autocomplete.getPlace();
            if (place.geometry) {
                var lat = place.geometry.location.lat();
                var lng = place.geometry.location.lng();
                $('#lat').val(lat);
                $('#long').val(lng);
                getLatLongPosition(lat, lng);
                updateDeliveryOptions(lat, lng);
            }
        });

        if ($('.main-search-input-item')[0]) {
            setTimeout(function() {
                $(".pac-container").prependTo("#autocomplete-container");
            }, 300);
        }
    }

    function getLocation(lat, long) {
        geocoder = new google.maps.Geocoder();
        if (navigator.geolocation) {
            if (lat && long) {
                showGetPosition(lat, long);
            } else {
                navigator.geolocation.getCurrentPosition(showPosition, function(error) {
                    console.error("Error getting position: ", error);
                });
            }
        } else {
            alert("Geolocation is not supported by this browser.");
        }
    }

    function showPosition(position) {
        var Latitude = position.coords.latitude;
        var Longitude = position.coords.longitude;
        $('#lat').val(Latitude);
        $('#long').val(Longitude);
        getLatLongPosition(Latitude, Longitude);
    }

    function showGetPosition(lat, long) {
        var Latitude = lat;
        var Longitude = long;
        $('#lat').val(Latitude);
        $('#long').val(Longitude);
        getLatLongPosition(Latitude, Longitude);
    }

    function getLatLongPosition(latitude, longitude) {
        const myLatlng = { lat: parseFloat(latitude), lng: parseFloat(longitude) };
        map = new google.maps.Map(document.getElementById("googleMap"), {
            zoom: 15,
            center: myLatlng,
        });

        if (marker) {
            marker.setMap(null);
        }

        marker = new google.maps.Marker({
            position: myLatlng,
            map: map,
            draggable: true,
            title: "Your current location.",
        });

        google.maps.event.addListener(marker, 'dragend', function() {
            var latLng = marker.getPosition();
            $('#lat').val(latLng.lat());
            $('#long').val(latLng.lng());
            updateDeliveryOptions(latLng.lat(), latLng.lng());
        });

        google.maps.event.addListener(marker, 'click', function() {
            var latLng = marker.getPosition();
            alert('Marker clicked at: ' + latLng.lat() + ', ' + latLng.lng());
        });

        $('#lat').val(latitude);
        $('#long').val(longitude);
    }

    function distance(lat1, lon1, lat2, lon2) {
        var radlat1 = Math.PI * lat1 / 180;
        var radlat2 = Math.PI * lat2 / 180;
        var theta = lon1 - lon2;
        var radtheta = Math.PI * theta / 180;
        var dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);
        dist = Math.acos(dist);
        dist = dist * 180 / Math.PI;
        dist = dist * 60 * 1.1515;
        dist = dist * 1.609344;
        return dist;
    }

    function updateDeliveryOptions(lat, lng) {
        var pickupLat = parseFloat($('#pickup_lat').val());
        var pickupLong = parseFloat($('#pickup_long').val());
        var dist = distance(pickupLat, pickupLong, lat, lng);
        $('#delivery_distance').val(dist);

        var $deliveryTypeSelect = $('#delivery_type_id');
        var defaultParcelTime = $('#default_parcel_time').val();
        var currentTime = new Date();
        var [defaultHours, defaultMinutes] = defaultParcelTime.split(':').map(Number);

        $deliveryTypeSelect.empty();

        var isAfterDefaultTime = (currentTime.getHours() > defaultHours) ||
            (currentTime.getHours() === defaultHours && currentTime.getMinutes() > defaultMinutes);

        if (dist <= 15) {
            if (!isAfterDefaultTime) {
                $deliveryTypeSelect.append('<option value="express">Express</option>');
            }
        }

        if (dist <= 50) {
            if (!isAfterDefaultTime) {
                $deliveryTypeSelect.append('<option value="same_day">Same Day</option>');
            }
        }

        $deliveryTypeSelect.append('<option value="normal">Normal</option>');
        $deliveryTypeSelect.trigger('change');
    }

    initAutocomplete();
});
