/**
 *
 * You can write your JS code here, DO NOT touch the default style file
 * because it will make it harder for you to update.
 *
 */

"use strict";
// var mapLat = mapLat;
// var mapLong = mapLong;
//
// function initAutocomplete() {
//     if(mapLat !='' && mapLong !=''){
//         getLocation(mapLat,mapLong);
//     }else{
//         getLocation(null,null);
//     }
//     var input = document.getElementById('autocomplete-input');
//     var autocomplete = new google.maps.places.Autocomplete(input);
//     autocomplete.addListener('place_changed', function() {
//         var place = autocomplete.getPlace();
//         $('#lat').val(place.geometry.location.lat());
//         $('#long').val(place.geometry.location.lng());
//         if (!place.geometry) {
//             return;
//         }
//     });
//     if ($('.main-search-input-item')[0]) {
//
//         setTimeout(function() {
//             $(".pac-container").prependTo("#autocomplete-container");
//         }, 300);
//     }
// }
// var geocoder;
// function getLocation(lat,long) {
//     geocoder = new google.maps.Geocoder();
//     if (navigator.geolocation) {
//         if(lat && long){
//             showGetPosition(lat,long)
//         }else{
//             navigator.geolocation.getCurrentPosition(showPosition);
//         }
//     } else {
//         var msg = "Geolocation is not supported by this browser.";
//         alert(msg);
//     }
// }
// function showPosition(position) {
//     var Latitude = position.coords.latitude;
//     var Longitude = position.coords.longitude;
//     $('#lat').val(Latitude);
//     $('#long').val(Longitude);
//
//     var latlng = new google.maps.LatLng(Latitude, Longitude);
//     geocoder.geocode({'latLng': latlng}, function(results, status) {
//         if (status == google.maps.GeocoderStatus.OK) {
//             if (results[1]) {
//                 $('#autocomplete-input').val(results[0].formatted_address);
//             }
//         }
//     })
//
// }
// function showGetPosition(lat,long) {
//     var Latitude = lat;
//     var Longitude = long;
//     $('#lat').val(Latitude);
//     $('#long').val(Longitude);
//
//     var latlng = new google.maps.LatLng(Latitude, Longitude);
//     geocoder.geocode({'latLng': latlng}, function(results, status) {
//         if (status == google.maps.GeocoderStatus.OK) {
//             if (results[1]) {
//                 $('#autocomplete-input').val(results[0].formatted_address);
//             }
//         }
//     })
//
// }


function initMap() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
            console.log("initMap")
            initAutocomplete();
            getLatLongPosition(position.coords.latitude, position.coords.longitude);
        });
    } else {
        alert("Sorry, your browser does not support HTML5 geolocation.");
    }
}

function getLatLongPosition(latitude, longitude) {
    const myLatlng = {
        lat: parseFloat(latitude),
        lng: parseFloat(longitude)
    };
    const map = new google.maps.Map(document.getElementById("googleMap"), {
        zoom: 15,
        center: myLatlng,
    });

    // Create the initial InfoWindow.
    let infoWindow = new google.maps.InfoWindow({
        content: "Click the map to get latitude & longitude!",
        position: myLatlng,
    });

    infoWindow.open(map);
    // Configure the click listener.
    var marker;
    let total = 0;
    map.addListener("click", (mapsMouseEvent) => {
        // Close the current InfoWindow.
        infoWindow.close();
        // Create a new InfoWindow.
        infoWindow = new google.maps.InfoWindow({
            position: mapsMouseEvent.latLng,
        });

        var latLng = mapsMouseEvent.latLng.toJSON();

        var latlng = new google.maps.LatLng(latLng.lat, latLng.lng);
        var geocoder = geocoder = new google.maps.Geocoder();
        geocoder.geocode({
            'latLng': latlng
        }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                if (results[1]) {
                    $('#autocomplete-input').val(results[1].formatted_address);

                }
            }
        });

        $('#lat').val(latLng.lat);
        $('#long').val(latLng.lng);

        updateDeliveryOptions(latLng.lat, latLng.lng);

        if (marker)
            marker.setMap(null);
        marker = new google.maps.Marker({
            position: myLatlng,
            map,
            draggable: true,
            title: "Your current location.",
        });

        changeMarkerPosition(latLng, marker)

    });
    $('#lat').val(latitude);
    $('#long').val(longitude);
    marker = new google.maps.Marker({
        position: myLatlng,
        map,
        draggable: true,
        title: "Your current location.",
    });
}

function changeMarkerPosition(latLng, marker) {
    var latlng = new google.maps.LatLng(latLng.lat, latLng.lng);
    marker.setPosition(latlng);
}

var mapLat = mapLat;
var mapLong = mapLong;

function initAutocomplete() {
    console.log("intiAutocomplete")
    if (mapLat != '' && mapLong != '') {
        getLocation(mapLat, mapLong);
    } else {
        getLocation(null, null);
    }

    var input = document.getElementById('autocomplete-input');
    var autocomplete = new google.maps.places.Autocomplete(input);


    autocomplete.addListener('place_changed', function () {
        console.log("changed")

        var place = autocomplete.getPlace();
        getLatLongPosition(place.geometry.location.lat(), place.geometry.location.lng());
        $('#lat').val(place.geometry.location.lat());
        $('#long').val(place.geometry.location.lng());
        if (!place.geometry) {
            return;
        }
        updateDeliveryOptions($('#lat').val(), $('#long').val());
    });

    if ($('.main-search-input-item')[0]) {
        setTimeout(function () {
            $(".pac-container").prependTo("#autocomplete-container");
        }, 300);
    }
}
var geocoder;

function getLocation(lat, long) {

    geocoder = new google.maps.Geocoder();
    if (navigator.geolocation) {
        if (lat && long) {
            showGetPosition(lat, long)
        } else {
            navigator.geolocation.getCurrentPosition(showPosition);
        }
    } else {
        var msg = "Geolocation is not supported by this browser.";
    }
}

function showPosition(position) {
    var Latitude = position.coords.latitude;
    var Longitude = position.coords.longitude;
    $('#lat').val(Latitude);
    $('#long').val(Longitude);
    getLatLongPosition(Latitude, Longitude);

    var latlng = new google.maps.LatLng(Latitude, Longitude);
    geocoder.geocode({
        'latLng': latlng
    }, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            if (results[1]) {
                $('#autocomplete-input').val(results[0].formatted_address);
            }
        }
    })

}

function showGetPosition(lat, long) {
    var Latitude = lat;
    var Longitude = long;
    $('#lat').val(Latitude);
    $('#long').val(Longitude);


    var latlng = new google.maps.LatLng(Latitude, Longitude);
    geocoder.geocode({
        'latLng': latlng
    }, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            if (results[1]) {
                $('#autocomplete-input').val(results[0].formatted_address);
            }
        }
    })

}


function distance(lat1, lon1, lat2, lon2) {
    var radlat1 = Math.PI * lat1 / 180
    var radlat2 = Math.PI * lat2 / 180
    var theta = lon1 - lon2
    var radtheta = Math.PI * theta / 180
    var dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);
    dist = Math.acos(dist)
    dist = dist * 180 / Math.PI
    dist = dist * 60 * 1.1515
    dist = dist * 1.609344
    return dist
}

function updateDeliveryOptions(lat, lng) {
    var pickupLat = parseFloat($('#pickup_lat').val());
    var pickupLong = parseFloat($('#pickup_long').val());
    var dist = distance(pickupLat, pickupLong, lat, lng);
    $('#delivery_distance').val(dist);
    console.log("distance in kms: " + dist);

    var $deliveryTypeSelect = $('#delivery_type_id');
    var defaultParcelTime = $('#default_parcel_time').val(); // Format: "15:00:00"

    var currentTime = new Date();

    var [defaultHours, defaultMinutes] = defaultParcelTime.split(':').map(Number);

    // Clear existing options except the first one
    $deliveryTypeSelect.find('option').remove();

    var isAfterDefaultTime = (currentTime.getHours() > defaultHours) ||
        (currentTime.getHours() === defaultHours && currentTime.getMinutes() > defaultMinutes);

    if (dist <= 15) {
        if (!isAfterDefaultTime && !$deliveryTypeSelect.find('option[value="express"]').length) {
            $deliveryTypeSelect.append('<option value="express">Express</option>');
        }
    }

    if (dist <= 50) {
        if (!isAfterDefaultTime && !$deliveryTypeSelect.find('option[value="same_day"]').length) {
            $deliveryTypeSelect.append('<option value="same_day">Same Day</option>');
        }
    }

    if (!$deliveryTypeSelect.find('option[value="normal"]').length) {
        $deliveryTypeSelect.append('<option value="normal">Normal</option>');
    }

    $deliveryTypeSelect.trigger('change');
}



