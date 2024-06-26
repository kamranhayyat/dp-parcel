<?php

namespace App\Repositories\Parcel;

interface ParcelInterface
{

    public function all();
    public function deliveryManParcel();
    public function filter($request);
    public function get($id);
    public function parcelEvents($id);
    public function parcelTracking($request);
    public function details($id);
    public function statusUpdate($id, $status_id);
    public function store($request);
    public function duplicateStore($request);
    public function update($id, $request);
    public function delete($id);
    public function deliveryCharges();
    public function deliveryCategories();
    public function packaging();
    public function deliveryTypes();
    public function pickupdatemanAssigned($id, $request);
    public function collectToPickup($id, $request);
    public function pickupdatemanAssignedCancel($id, $request);
    public function PickupReSchedule($id, $request);
    public function PickupReScheduleCancel($id, $request);
    public function receivedBypickupman($id, $request);
    public function receivedBypickupmanCancel($id, $request);
    public function receivedWarehouse($id, $request);
    public function receivedWarehouseCancel($id, $request);
    public function parcelBranchCancel($id, $request);
    public function transferToHubMultipleParcel($request);
    public function deliveryManAssignMultipleParcel($request);
    public function transfertohub($id, $request);
    public function receivedByHub($id, $request);
    public function receivedByHubCancel($id, $request);
    public function transfertoHubCancel($id, $request);
    public function deliverymanAssign($id, $request);
    public function deliverymanAssignCancel($id, $request);
    public function deliveryReschedule($id, $request);
    public function deliveryReScheduleCancel($id, $request);
    public function returntoQourier($id, $request);
    public function returntoQourierCancel($id, $request);
    public function returnAssignToMerchant($id, $request);
    public function returnAssignToMerchantCancel($id, $request);
    public function returnAssignToMerchantReschedule($id, $request);
    public function returnAssignToMerchantRescheduleCancel($id, $request);
    public function returnReceivedByMerchant($id, $request);
    public function returnReceivedByMerchantCancel($id, $request);
    public function parcelDelivered($id, $request);
    public function parcelDeliveredCancel($id, $request);
    public function parcelPartialDelivered($id, $request);
    public function parcelPartialDeliveredCancel($id, $request);
    public function search($data);
    public function searchDeliveryManAssingMultipleParcel($data);
    public function searchExpense($data);
    public function searchIncome($data);
    public function parcelReceivedByMultipleHub($id, $request);
    public function pickupdatemanAssignedBulk($request);
    public function AssignReturnToMerchantBulk($request);
    public function bulkParcels($ids);
    public function deliverymanStatusParcel($status);
    public function filterPrint($request);
    public function parcelSearchs($request);
    public function parcelMultiplePrintLabel($request);
}
