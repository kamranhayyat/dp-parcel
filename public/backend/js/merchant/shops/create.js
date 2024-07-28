"use strict";

$(document).ready(function () {
    function loadCities() {
        var districtId = $('#district_id').val();
        if (districtId) {
            $.ajax({
                type: 'POST',
                url: territoryCityUrl,
                data: {'district_id': districtId},
                dataType: 'html',
                success: function (data) {
                    var $citySelect = $('#city_id');
                    $citySelect.empty(); // Clear existing options
                    var cities = JSON.parse(data);
                    cities.forEach(function(city) {
                        $citySelect.append(`<option value="${city.id}">${city.name}</option>`);
                    });
                }
            });
        }
    }

    // Trigger loadCities on page load
    loadCities();

    // Trigger loadCities when district selection changes
    $(document).on('change', '#district_id', loadCities);
});

