<?php

namespace App\Http\Controllers\Backend;

use App\Enums\ParcelStatus;
use App\Http\Controllers\Controller;
use App\Repositories\DeliveryMan\DeliveryManInterface;
use Illuminate\Http\Request;
use App\Http\Requests\DeliveryMan\DeliveryManRequest;
use App\Models\Backend\ParcelEvent;
use Brian2694\Toastr\Facades\Toastr;
class DeliveryManController extends Controller
{
    protected $repo;
    public function __construct(DeliveryManInterface $repo)
    {
        $this->repo = $repo;
    }

    public function index(Request $request)
    {
        $deliveryMans = $this->repo->all();
        return view('backend.deliveryman.index',compact('deliveryMans','request'));
    }
    public function filter(Request $request)
    {
        $deliveryMans = $this->repo->filter($request);
        return view('backend.deliveryman.index',compact('deliveryMans','request'));
    }

    public function create()
    {
        $hubs         = $this->repo->hubs();
      return view('backend.deliveryman.create',compact('hubs'));
    }


    public function store(DeliveryManRequest $request)
    {

        if($this->repo->store($request)){
            Toastr::success(__('deliveryman.added_msg'),__('message.success'));
            return redirect()->route('deliveryman.index');
        }else{
            Toastr::error(__('deliveryman.error_msg'),__('message.error'));
            return redirect()->back();
        }
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        $hubs         = $this->repo->hubs();
        $deliveryman = $this->repo->get($id);
        return view('backend.deliveryman.edit',compact('deliveryman','hubs'));
    }

    public function update(DeliveryManRequest $request)
    {
        if($this->repo->update($request->id, $request)){
            Toastr::success(__('deliveryman.update_msg'),__('message.success'));
            return redirect()->route('deliveryman.index');
        }else{
            Toastr::error(__('deliveryman.error_msg'),__('message.error'));
            return redirect()->back();
        }
    }

    public function destroy($id)
    {
        $this->repo->delete($id);
        Toastr::success(__('deliveryman.delete_msg'),__('message.success'));
        return back();
    }


    public function view($id)
    {
        $parcelEvents = ParcelEvent::with('parcel')->where('delivery_man_id',$id)->whereHas('parcel',function($query){
            $query->where('status',ParcelStatus::DELIVERY_MAN_ASSIGN);
            $query->orWhere('status',ParcelStatus::DELIVERY_RE_SCHEDULE);
        })->whereIn('parcel_status', [ParcelStatus::DELIVERY_MAN_ASSIGN,ParcelStatus::DELIVERY_RE_SCHEDULE])->get();
        $totalAssigned_parcels        = $parcelEvents->count();
        $totalAssigned_parcels_weight = $parcelEvents->sum('ParcelWeight');

        $mapParcels = []; 
        if (!blank($parcelEvents)) {
            foreach ($parcelEvents as $key => $parcelEvent) { 
             
                $mapParcels[$key]['deliveryMan']      = @$parcelEvent->parcel->merchant->business_name;
                $mapParcels[$key]['deliveryPhone']    = @$parcelEvent->parcel->shop->contact_no;
                $mapParcels[$key]['deliveryImage']    = @$parcelEvent->parcel->merchant->user->image;
                $mapParcels[$key]['lat']              = $parcelEvent->parcel->customer_lat;
                $mapParcels[$key]['long']             = $parcelEvent->parcel->customer_long;
                $mapParcels[$key]['customer_name']    = $parcelEvent->parcel->customer_name;
                $mapParcels[$key]['customer_address'] = $parcelEvent->parcel->customer_address;
                $mapParcels[$key]['customer_phone']   = $parcelEvent->parcel->customer_phone;
                $mapParcels[$key]['merchant_business_name'] = $parcelEvent->parcel->customer_name;
                $mapParcels[$key]['merchant_phone']   = $parcelEvent->parcel->merchant->user->mobile;
                $mapParcels[$key]['merchant_address'] = $parcelEvent->parcel->merchant->address;
                $mapParcels[$key]['current_payable']  = $parcelEvent->parcel->current_payable;
                $mapParcels[$key]['tracking_id']      = $parcelEvent->parcel->tracking_id;
                $mapParcels[$key]['url']              = route('parcel.logs', $parcelEvent->parcel->id);
            }
        } 
        return view('backend.deliveryman.parcel-map-logs', compact('mapParcels','totalAssigned_parcels','totalAssigned_parcels_weight'));
    }

}
