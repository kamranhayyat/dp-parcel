"use strict";
$(document).ready(function(){

    $( "#shopID" ).select2();
    $( "#category_id" ).select2();
    $( "#weightID" ).select2();
    //$( "#delivery_type_id" ).select2();
    deliveryCharge();
});

$(document).on('change', '#shopID', function () {
    var url = $(this).data('url');
    $.ajax({
        type : 'POST',
        url : url,
        data : {'id': $(this).val(),'shop':false},
        dataType : "html",
        success : function (data) {
            var shop = JSON.parse(data);
            $('#merchant_id').val(shop.merchant_id);
            $('#pickup_phone').val(shop.contact_no);
            $('#pickup_address').val(shop.address);
            $('#pickup_lat').val(shop.merchant_lat);
            $('#pickup_long').val(shop.merchant_long);
        }
    });
});


$('#categoryWeight').hide();
$('#weightID').hide();
$(document).on('change', '#category_id', function () {
    var category_id = $(this).val();
    if(category_id !==''){
        $.ajax({
            type : 'POST',
            url : $(this).data('url'),
            data : {'category_id': $(this).val()},
            dataType : "html",
            success : function (data) {
                if(category_id == '1'){
                    $('#categoryWeight').show();
                    $('#weightID').show();
                    $('#weightID').html(data);
                    $( "#weightID" ).select2();
                }else {
                    $('#categoryWeight').hide();
                    $('#weightID').hide();
                }
                deliveryCharge();
            }
        });

    }
});

$(document).on('change', '#delivery_type_id', function () {
    deliveryCharge();

    //cod charge calculation
    var delivery_type   = $(this).val();
    var cash_collection =  parseFloat($("#cash_collection").val());
    if(cash_collection == '' || isNaN(cash_collection)){
        cash_collection = 0;
    }
    var type = 0;
    if(delivery_type == 1 || delivery_type == 2){
        type = $("#inside_city").val();
    }else if(delivery_type == 3){
        type = $("#sub_city").val();
    }else if(delivery_type == 4){
        type = $("#outside_city").val();
    }else{
        type = 0;
    }
    var codAmount       = percentage(cash_collection,type);

    $('#codChargeAmount').text(codAmount.toFixed(2));
    //end cod charge calculation

});

$(document).on('change', '#weightID', function () {
    deliveryCharge();

});
$('#packagingShow').hide();
$(document).on('change', '#packaging_id', function () {
    var amount = parseFloat($("select#packaging_id option").filter(":selected").data('packagingamount'));
    console.log(amount);
    if(isNaN(amount) || amount === ''){
        $('#packagingShow').hide();
        amount = 0;
    }else{
        $('#packagingShow').show();
    }

    $('#packagingAmount').text(amount);
    totalSum();

});

$('.hideShowLiquidFragile').hide();
function processCheck(event) {
    var liquidFragileAmount = 0;
    if($('#fragileLiquid').is(':checked')) {
        $('.hideShowLiquidFragile').show();
        liquidFragileAmount = parseFloat($('#fragileLiquid').data('amount'));
        $('#liquidFragileAmount').text(liquidFragileAmount.toFixed(2));
    } else {
        $('.hideShowLiquidFragile').hide();
        liquidFragileAmount = 0;
        $('#liquidFragileAmount').text(liquidFragileAmount.toFixed(2));
    }
    totalSum();
}


function percentage(totalAmount,percentageAmount) {

    return totalAmount * (percentageAmount / 100);
}

$(document).on('keyup change', '#cash_collection', function () {
    var cash_collection =  parseFloat($(this).val());
    if(cash_collection === '' || isNaN(cash_collection)){
        $('#totalCashCollection').text('0.00');
        $('#codChargeAmount').text('0.00');
    }else {
        var delivery_type   = $('#delivery_type_id').val();
        var type = 0;
        if(delivery_type == 1 || delivery_type == 2){
            type = $("#inside_city").val();
        }else if(delivery_type == 3){
            type = $("#sub_city").val();
        }else if(delivery_type == 4){
            type = $("#outside_city").val();
        }else{
            type = 0;
        }
        var codAmount = percentage(cash_collection,type);
        $('#codChargeAmount').text(codAmount.toFixed(2));
        $('#totalCashCollection').text(cash_collection);
    }
    totalSum();

});

function deliveryCharge() {
    var merchant_id            = $("select#merchant_id option").filter(":selected").val();
    var weight             = $("#weight").val();
    var delivery_type_id   = $("select#delivery_type_id option").filter(":selected").val();
    var destination_district_id   = $("select#district_id option").filter(":selected").val();
    var pickup_district_id   = $("#pickup_district_id").val();
    var delivery_distance   = $('#delivery_distance').val();

    $.ajax({
        type : 'POST',
        url : deliverChargeUrl,
        data : {
            'merchant_id': merchant_id,
            'weight':weight,
            'delivery_type_id':delivery_type_id,
            'pickup_district_id':pickup_district_id,
            'destination_district_id':destination_district_id,
            'delivery_distance': delivery_distance
        },
        dataType : "json",
        beforeSend: function() {
            clearErrorMessages();
        },
        success : function (data) {
            $('#deliveryChargeAmount').text(data);
            totalSum();
        },
        error: function(jqXHR, textStatus, errorThrown) {
            if (jqXHR.status === 400) {
                var response = jqXHR.responseJSON;
                var field = response.field;
                var message = response.message;

                $('#' + field + '_error').text(message);
            } else {
                // Handle other errors
                console.error('Unexpected error:', errorThrown);
            }
        }
    });

}

function clearErrorMessages() {
    $('.error-message').text('');
}

function totalSum() {
    merchant();
    var totalCashCollection          =  parseFloat($('#totalCashCollection').text());
    var deliveryChargeAmount         =  parseFloat($('#deliveryChargeAmount').text());
    var codChargeAmount              =  parseFloat($('#codChargeAmount').text());
    var vatTex                       = parseFloat($('#merchantVat').val());
    var merchantCodCharge            = parseFloat( $('#merchantCodCharge').val());
    var liquidFragileAmount          =  parseFloat($('#liquidFragileAmount').text());
    var packagingAmount              =  parseFloat($('#packagingAmount').text());

    var totalAmount = (deliveryChargeAmount+codChargeAmount+liquidFragileAmount+packagingAmount);
    var vat = percentage(totalAmount, vatTex);
    $('#VatAmount').text(vat.toFixed(2));
    $('#totalDeliveryChargeAmount').text(totalAmount.toFixed(2));
    totalAmount +=vat;
    var totalCurrentAmount = (totalCashCollection-totalAmount);

    $('#netPayable').text(totalAmount.toFixed(2));

//    $('#totalDeliveryChargeAmount').text(totalAmount.toFixed(2));
    $('#currentPayable').text(totalCurrentAmount.toFixed(2));

    var totalDeliveryChargeAmount    =  parseFloat($('#totalDeliveryChargeAmount').text());
    var currentPayable               =  parseFloat($('#currentPayable').text());
    var VatAmount                    =  parseFloat($('#VatAmount').text());

    var obj = {'vatTex':vatTex,'merchantCodCharge':merchantCodCharge,'totalCashCollection':totalCashCollection,'deliveryChargeAmount':deliveryChargeAmount,'codChargeAmount':codChargeAmount,'VatAmount':VatAmount,'liquidFragileAmount':liquidFragileAmount,'packagingAmount':packagingAmount,'totalDeliveryChargeAmount':totalDeliveryChargeAmount,'currentPayable':currentPayable}
    $('#chargeDetails').val(JSON.stringify(obj));

}

function merchant(){
    var delivery_type_id       = $("select#delivery_type_id option").filter(":selected").val();
    var cash_collection =  parseFloat($('#cash_collection').val());
    if(isNaN(cash_collection)){
        cash_collection =0;
    }
    var merchantCodCharge = 0;
    var codAmount = 0;
    if(delivery_type_id !=='' && delivery_type_id ==='1' || delivery_type_id ==='2'){
        merchantCodCharge = merchantData.cod_charges.inside_city;
        codAmount = parseFloat(percentage(cash_collection, merchantData.cod_charges.inside_city));
    }else if(delivery_type_id !=='' && delivery_type_id ==='3'){
        merchantCodCharge = merchantData.cod_charges.sub_city;
        codAmount = parseFloat(percentage(cash_collection, merchantData.cod_charges.sub_city));
    }else if(delivery_type_id !=='' && delivery_type_id ==='4') {
        merchantCodCharge = merchantData.cod_charges.outside_city;
        codAmount = parseFloat(percentage(cash_collection, merchantData.cod_charges.outside_city));
    }else {
        merchantCodCharge = 0;
        codAmount = parseFloat(percentage(cash_collection, 0));
    }

    // $('#codChargeAmount').text(codAmount.toFixed(2));

    $('#merchantVat').val(merchantData.vat);
    $('#merchantCodCharge').val(merchantCodCharge);
}


