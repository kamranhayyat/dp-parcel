"use strict";

$(document).on('change', '#district_id', function () {
    $.ajax({
        type : 'POST',
        url : territoryCityUrl,
        data : {'district_id': $(this).val()},
        dataType : "html",
        success : function (data) {
            var $citySelect = $('#city_id');
            $citySelect.find('option').remove();
            var cities = JSON.parse(data)
            for (const city of cities) {
                $citySelect.append(`<option value=${city.id}>${city.name}</option>`);
                console.log(city.name);
            }
        }
    });
});
