"use strict";

// Delivery charge -> When category selected Same Day or Express, then show time fields otherwise not
$("#category").on('change', function () {
    var selectedSlug = $("#category option:selected").data('value');

    if(selectedSlug === 'same_day' || selectedSlug === 'express') {
        $("#sub-cat-group").addClass('d-none');
    } else if(selectedSlug === 'normal') {
        $("#sub-cat-group").removeClass('d-none');
    } else {
        $("#sub-cat-group").addClass('d-none');
    }

    // Update the hidden input with the selected slug value
    $("#category_slug").val(selectedSlug);
});

$(document).ready(function() {
    $("#category").trigger('change');
});
