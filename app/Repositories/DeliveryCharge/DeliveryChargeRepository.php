<?php
namespace App\Repositories\DeliveryCharge;
use App\Models\Backend\DeliveryCharge;
use App\Models\Backend\Deliverycategory;
use App\Repositories\DeliveryCharge\DeliveryChargeInterface;
use App\Enums\Status;
use App\Enums\UserType;
use Illuminate\Support\Arr;

class DeliveryChargeRepository implements DeliveryChargeInterface{
    public function allGet(){
        $dCharges      = DeliveryCharge::orderBy('position')->get();
        $categoryWise  = $dCharges->groupBy('category_id');
        return Arr::collapse($categoryWise);
        $Charges = [];
        foreach ($categoryWise as $key=>$Deliverycharge) {
            foreach ($Deliverycharge as $charge) {
                $Charges[] = $charge;
            }
        }
        return $Charges;
    }
    public function getAllCharge(){
        $dCharges      = DeliveryCharge::orderBy('position')->get();
        $categoryWise  = $dCharges->groupBy('category_id');
        return Arr::collapse($categoryWise);
    }
    public function all(){
        return DeliveryCharge::orderBy('position')->paginate(10);
    }

     public function filter($request){
         return DeliveryCharge::where(function($query)use($request){
             if($request->category){
                 $query->where('category_id',$request->category);
             }
             if($request->weight):
                 $query->where('weight',$request->weight);
             endif;

         })->orderBy('position')->paginate(10);
     }

    public function categories(){
        return Deliverycategory::all();
    }

    public function get($id){
        return DeliveryCharge::find($id);
    }

    public function store($request){
        try {
            $delivery_charge               = new DeliveryCharge();
            $delivery_charge->category  = $request->category;
            $delivery_charge->sub_category  = $request->sub_category;
            $delivery_charge->first_kg  = $request->first_kg;
            $delivery_charge->other_kg  = $request->other_kg;
            $delivery_charge->time  = $request->time;
            $delivery_charge->status       = $request->status;
            $delivery_charge->save();
            return true;
        }
        catch (\Exception $e) {
            return false;
        }
    }

    public function update($request)
    {
        try {
            $delivery_charge               = DeliveryCharge::find($request->id);
            $delivery_charge->category  = $request->category;
            $delivery_charge->sub_category  = $request->sub_category;
            $delivery_charge->first_kg  = $request->first_kg;
            $delivery_charge->other_kg  = $request->other_kg;
            $delivery_charge->time  = $request->time;
            $delivery_charge->status       = $request->status;
            $delivery_charge->save();
            return true;
        }
        catch (\Exception $e) {
            return false;
        }
    }
    public function delete($id){
        return DeliveryCharge::destroy($id);
    }
}
