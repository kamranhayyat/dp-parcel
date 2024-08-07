<?php

namespace App\Http\Controllers\Backend\MerchantPanel;

use App\Enums\Status;
use App\Http\Controllers\Controller;
use App\Imports\ParcelImport;
use App\Models\Backend\DeliveryCharge;
use App\Models\Backend\MerchantDeliveryCharge;
use App\Models\City;
use App\Models\District;
use App\Models\MerchantShops;
use App\Repositories\GeneralSettings\GeneralSettingsInterface;
use App\Repositories\Merchant\MerchantInterface;
use App\Repositories\MerchantPanel\MerchantParcel\MerchantParcelInterface;
use App\Repositories\MerchantPanel\Shops\ShopsInterface;
use Illuminate\Http\Request;
use App\Http\Requests\MerchantPanel\Parcel\StoreRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;
use App\Enums\ParcelStatus;
use App\Exports\MerchantParcelExport;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon;
use Maatwebsite\Excel\Facades\Excel;

class MerchantParcelController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    protected $merchant;
    protected $repo;
    protected $shop;
    protected $settingsRepo;
    public function __construct(MerchantParcelInterface $repo, MerchantInterface $merchant, ShopsInterface $shop, GeneralSettingsInterface $generalSettings)
    {
        $this->merchant = $merchant;
        $this->repo = $repo;
        $this->shop = $shop;
        $this->settingsRepo          = $generalSettings;
    }
    public function index(Request $request)
    {
        $userID = Auth::user()->id;
        $merchant = $this->repo->getMerchant($userID);
        $parcels = $this->repo->all($merchant->id);
        return view('backend.merchant_panel.parcel.index',compact('parcels','request' ));
    }
    public function parcelBank(Request $request)
    {
        $userID = Auth::user()->id;
        $merchant = $this->repo->getMerchant($userID);
        $parcels = $this->repo->parcelBank($merchant->id);
        return view('backend.merchant_panel.parcel.parcel_bank',compact('parcels','request' ));
    }

    public function filter(Request $request)
    {
        $userID = Auth::user()->id;
        $merchant = $this->repo->getMerchant($userID);
        if($this->repo->filter($merchant->id,$request)){
            $parcels      = $this->repo->filter($merchant->id,$request);
            return view('backend.merchant_panel.parcel.index',compact('parcels','request' ));
        }else{
            return redirect()->back();
        }
    }

    public function create()
    {
        $settings = $this->settingsRepo->all();
        $userID = Auth::user()->id;
        $merchant = $this->repo->getMerchant($userID);
        $shops = $this->repo->getShops($merchant->id);
        $merchantShop = $shops[0];
        $deliveryCategories = $this->repo->deliveryCategories();
        $deliveryCharges = $this->repo->deliveryCharges();
        $packagings = $this->repo->packaging();
        $deliveryTypes      = $this->repo->deliveryTypes();
        $districts          = $this->shop->getAllDistricts();
        $defaultParcelTime = $settings->parcel_time;
        return view('backend.merchant_panel.parcel.create',compact('merchant','merchantShop','deliveryTypes','shops','deliveryCategories','deliveryCharges','packagings', 'districts', 'defaultParcelTime'));
    }

    public function store(StoreRequest $request)
    {

        if(Auth::user()->merchant->wallet_use_activation == Status::ACTIVE):
            $chargeDetails = json_decode($request->chargeDetails);
            if($chargeDetails->totalDeliveryChargeAmount > Auth::user()->merchant->wallet_balance):
                Toastr::error('You are low on balance. Please recharge', 'Error');
                return redirect()->route('merchant-panel.my.wallet.index');
            endif;
        endif;


        $userID = Auth::user()->id;
        $merchant = $this->repo->getMerchant($userID);
        if($this->repo->store($request,$merchant->id)){
            Toastr::success(__('parcel.added_msg'),__('message.success'));
            return redirect()->route('merchant-panel.parcel.index');
        }else{
            Toastr::error(__('parcel.error_msg'),__('message.error'));
            return redirect()->back();
        }
    }

    public function duplicateStore(StoreRequest $request)
    {
        $userID = Auth::user()->id;
        $merchant = $this->repo->getMerchant($userID);
        if($this->repo->duplicateStore($request,$merchant->id)){
            Toastr::success(__('parcel.added_msg'),__('message.success'));
            return redirect()->route('merchant-panel.parcel.index');
        }else{
            Toastr::error(__('parcel.error_msg'),__('message.error'));
            return redirect()->back();
        }
    }


    public function show($id)
    {
        //
    }

    // Parcel logs
    public function logs($id)
    {
        $parcel       = $this->repo->get($id);
        $parcelevents = $this->repo->parcelEvents($id);
        return view('backend.merchant_panel.parcel.logs', compact('parcel','parcelevents'));
    }

    // Parcel duplicate
    public function duplicate($id)
    {
        $parcel          = $this->repo->get($id);
        $merchant        = $this->merchant->get($parcel->merchant_id);
        $shops           = $this->shop->all($parcel->merchant_id);
        $deliveryCharges = DeliveryCharge::where('category_id',$parcel->category_id)->get();

        $deliveryCategories      = $this->repo->deliveryCategories();
        $deliveryCategoryCharges = $this->repo->deliveryCharges();

        $packagings    = $this->repo->packaging();
        $deliveryTypes = $this->repo->deliveryTypes();
        return view('backend.merchant_panel.parcel.duplicate',compact('parcel','merchant','deliveryTypes','shops','deliveryCategories','deliveryCategoryCharges','deliveryCharges','packagings'));
    }

    // Parcel details
    public function details($id)
    {
        // return $this->repo->details($id);
        $parcel       = $this->repo->details($id);
        $parcelevents = $this->repo->parcelEvents($id);
        return view('backend.merchant_panel.parcel.details',compact('parcel','parcelevents'));
    }

    public function edit($id)
    {
        $userID = Auth::user()->id;
        $parcel = $this->repo->get($id);
        if($parcel->status == ParcelStatus::PENDING){
            $merchant = $this->repo->getMerchant($userID);
            $shops = $this->repo->getShops($merchant->id);
            $deliveryCharges = DeliveryCharge::where('category_id',$parcel->category_id)->get();
            $deliveryCategories = $this->repo->deliveryCategories();
            $deliveryCategoryCharges = $this->repo->deliveryCharges();
            $packagings = $this->repo->packaging();
            $deliveryTypes      = $this->repo->deliveryTypes();
            $districts          = $this->shop->getAllDistricts();
            $cities = City::query()->select('id', 'name')->where('district_id', $parcel->district_id)->get();
            return view('backend.merchant_panel.parcel.edit',compact('parcel','merchant','deliveryTypes','shops','deliveryCategories','deliveryCategoryCharges','deliveryCharges','packagings', 'cities', 'districts'));
        }
        else{
            Toastr::error(__('parcel.edit_error_message'),__('message.error'));
            return redirect()->route('merchant-panel.parcel.index');
        }

    }


    // Parcel update
    public function statusUpdate($id, $status_id)
    {
        $this->repo->statusUpdate($id, $status_id);
        Toastr::success(__('parcel.update_msg'),__('message.success'));
        return redirect()->route('merchant-panel.parcel.index');
    }

    public function update(StoreRequest $request,$id)
    {
        $userID = Auth::user()->id;
        if($this->repo->update($id, $request,$userID)){
            Toastr::success(__('parcel.update_msg'),__('message.success'));
            return redirect()->route('merchant-panel.parcel.index');
        }else{
            Toastr::error(__('parcel.error_msg'),__('message.error'));
            return redirect()->back();
        }
    }


    public function destroy($id)
    {
        $userID = Auth::user()->id;
        $parcel = $this->repo->get($id);
        if($parcel->status == ParcelStatus::PENDING){
            $this->repo->delete($id,$userID);
            Toastr::success(__('parcel.delete_msg'),__('message.success'));
            return back();
        }
        else{
            Toastr::error(__('parcel.delete_error_message'),__('message.error'));
            return redirect()->route('merchant-panel.parcel.index');
        }
    }

    public function parcelImportExport()
    {
        $deliveryCategories = $this->repo->deliveryCategories();
        return view('backend.merchant_panel.parcel.import',compact('deliveryCategories'));
    }

    public function parcelImport(Request $request)
    {
        $request->validate([
            'file' => 'required',
        ]);
        try {
            $import = new ParcelImport();
            $import->import($request->file('file'));
        } catch (ValidationException $e) {
            $failures = $e->failures();
            $importErrors = [];
            foreach ($failures as $failure) {
                $failure->row(); // row that went wrong
                $failure->attribute(); // either heading key (if using heading row concern) or column index
                $failure->errors(); // Actual error messages from Laravel validator
                $failure->values(); // The values of the row that has failed.
                $importErrors[$failure->row()][] = $failure->errors()[0];
            }
            return back()->with('importErrors', $importErrors);
        }
        Toastr::success(__('parcel.added_msg'),__('message.success'));
        return redirect()->route('merchant-panel.parcel.index');
    }

    public function merchantShops(Request $request)
    {
        if (request()->ajax()) {
            if ($request->id && $request->shop == 'true') {
                $merchantShops = [];
                $merchantShop = MerchantShops::where(['merchant_id'=>$request->id,'default_shop'=>Status::ACTIVE])->first();
                $merchantShops[]= $merchantShop;
                $merchantShopArray = MerchantShops::where(['merchant_id'=>$request->id,'default_shop'=>Status::INACTIVE])->get();
                if(!blank($merchantShopArray)){
                    foreach ($merchantShopArray as $shop){
                        $merchantShops[] = $shop;
                    }
                }
                if (!blank($merchantShops)) {
                    return view('backend.parcel.shops', compact('merchantShops'));
                }
                return '';
            }else {
                $merchantShop = MerchantShops::find($request->id);
                if (!blank($merchantShop)) {
                    return $merchantShop;
                }
                return '';
            }
        }
        return '';
    }

    public function deliveryCharge(Request $request)
    {
        if (request()->ajax()) {
            $fields = [
                'weight' => 'Weight should not be empty',
                'delivery_type_id' => 'Delivery type should not be empty',
            ];

            if($request->delivery_type_id !== 'normal') {
                $fields['delivery_distance'] = 'Delivery distance should not be empty';
            }

            foreach ($fields as $field => $message) {
                if ($request->input($field) == null) {
                    return response()->json([
                        'field' => $field,
                        'message' => $message,
                    ], 400);
                }
            }

            $pickUpDistrict = District::query()->where('id', $request->pickup_district_id)->first();
            $deliveryDistrict = District::query()->where('id', $request->destination_district_id)->first();
            $subCategory = null;

            if($request->delivery_type_id === 'normal') {
                if($request->pickup_district_id === $request->destination_district_id && $pickUpDistrict->number != "1") {
                    $subCategory = 'same_sector';
                } else if($pickUpDistrict->number == "1" && $deliveryDistrict->number == "1") {
                    $subCategory = $deliveryDistrict->sector;
                } else if($request->pickup_district_id !== $request->destination_district_id &&
                    $pickUpDistrict->number !== $deliveryDistrict->number) {
                    $subCategory = 'different_sector';
                }
            }


            $deliveryCharge = DeliveryCharge::query()
                ->where('category', $request->delivery_type_id)
                ->when($request->delivery_type_id == 'normal', function ($query) use ($subCategory) {
                    return $query->where('sub_category', $subCategory);
                })
                ->first();

            if (!$deliveryCharge) {
                return response()->json(['error' => 'Delivery charge not found'], 404);
            }

            $deliveryChargeOtherKgRate = 0;

            if($request->delivery_type_id === 'normal') {
                $deliveryChargeFirstKgRate = $deliveryCharge->first_kg;
            } else {
                $deliveryChargeFirstKgRate = $deliveryCharge->first_kg * $request->delivery_distance;
            }

            if($request->weight > 1) {
                $deliveryChargeOtherKgRate = ($request->weight - 1) * $deliveryCharge->other_kg;
            }

            return  $deliveryChargeFirstKgRate + $deliveryChargeOtherKgRate;
        }
    }

    public function deliveryWeight(Request $request)
    {
        if (request()->ajax()) {
            if ($request->category_id) {
                $deliveryCharges = DeliveryCharge::where('category_id',$request->category_id)->get();

                if (!blank($deliveryCharges)) {
                    return view('backend.merchant_panel.parcel.deliveryWeight', compact('deliveryCharges'));
                }
                return '';
            }
        }
        return '';
    }

    public function parcelExport(Request $request){
        try {
            if($request->type && $request->type == 'csv'):
                return Excel::download(new MerchantParcelExport($this->repo->parcelExport($request)),'Parcels Export-csv-file-'.Carbon::now()->format('d-m-Y His').'.csv',\Maatwebsite\Excel\Excel::CSV, [
                    'Content-Type' => 'text/csv',
                ]);
            else:
                return Excel::download(new MerchantParcelExport($this->repo->parcelExport($request)),'Parcels Export-excel-file-'.Carbon::now()->format('d-m-Y His').'.xlsx');
            endif;
        } catch (\Throwable $th) {
            Toastr::error(__('parcel.delete_error_message'),__('message.error'));
            return redirect()->back();
        }
    }
}
