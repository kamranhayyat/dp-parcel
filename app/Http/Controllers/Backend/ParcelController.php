<?php

namespace App\Http\Controllers\Backend;

use App\Enums\ParcelStatus;
use App\Enums\Status;
use App\Enums\UserType;
use App\Exports\ParcelSampleExport;
use App\Http\Controllers\Controller;
use App\Imports\ParcelImport;
use App\Models\Backend\DeliveryCharge;
use App\Models\Backend\Hub;
use App\Models\Backend\Merchant;
use App\Models\Backend\MerchantDeliveryCharge;
use App\Models\City;
use App\Models\District;
use App\Models\MerchantShops;
use App\Repositories\GeneralSettings\GeneralSettingsInterface;
use App\Repositories\Merchant\MerchantInterface;
use App\Repositories\MerchantPanel\Shops\ShopsInterface;
use Illuminate\Database\Query\Builder;
use Illuminate\Http\Request;
use App\Http\Requests\Parcel\StoreRequest;
use App\Models\Backend\Parcel;
use App\Models\Backend\ParcelEvent;
use App\Models\User;
use App\Repositories\DeliveryMan\DeliveryManInterface;
use App\Repositories\Hub\HubInterface;
use App\Repositories\Parcel\ParcelInterface;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Auth;
use Maatwebsite\Excel\Facades\Excel;
use Throwable;
use function PHPUnit\Framework\isEmpty;

class ParcelController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    protected $merchant;
    protected $repo;
    protected $shop;
    protected $deliveryman;
    protected $hub;
    protected $settingsRepo;
    public function __construct(
        ParcelInterface $repo,
        MerchantInterface $merchant,
        ShopsInterface $shop,
        DeliveryManInterface $deliveryman,
        HubInterface $hub,
        GeneralSettingsInterface $generalSettings
    ) {
        $this->merchant     = $merchant;
        $this->repo         = $repo;
        $this->shop         = $shop;
        $this->deliveryman  = $deliveryman;
        $this->hub          = $hub;
        $this->settingsRepo          = $generalSettings;
    }

    public function index(Request $request)
    {
        $parcels        = $this->repo->all();
        $deliverymans   = $this->deliveryman->all();
        $hubs           = $this->hub->all();

        $search = $request->input('search');
        $refreshParcels = $request->input('refreshParcels');

        if($search === null && $refreshParcels === null) {
            return view('backend.parcel.index', compact('parcels', 'deliverymans', 'hubs', 'request'));
        } else if($refreshParcels || $search !== '') {
            $parcels = Parcel::query()
                ->where('tracking_id', 'like', '%' . $search . '%')
                ->orWhereHas('merchant', function ($query) use ($search) {
                    $query->where('business_name', 'like', '%' . $search . '%')
                        ->orWhereHas('user', function ($query) use ($search) {
                            $query->where('mobile', 'like', '%' . $search . '%');
                        });
                })
                ->orWhere('customer_phone', 'like', '%' . $search . '%')
                ->orderBy('created_at', 'desc')
                ->paginate(10);

            return response()->json([
                'html' => view('backend.parcel.partials.parcel_table_body', compact('parcels','deliverymans', 'hubs', 'request'))->render()
            ]);
        }
    }

    public function filter(Request $request)
    {
        if ($this->repo->filter($request)) {
            $parcels      = $this->repo->filter($request);
            $parcelsPrint = $this->repo->filterPrint($request);
            $deliverymans = $this->deliveryman->all();
            $hubs         = $this->hub->all();
            $request['filter'] = 'on';
            return view('backend.parcel.index', compact('parcels', 'deliverymans', 'hubs', 'request', 'parcelsPrint'));
        } else {
            return redirect()->back();
        }
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     */
    public function create()
    {
        $settings = $this->settingsRepo->all();
        $merchants          = $this->merchant->all();
        $deliveryCategories = $this->repo->deliveryCategories();
        $deliveryCharges    = $this->repo->deliveryCharges();
        $packagings         = $this->repo->packaging();
        $deliveryTypes      = $this->repo->deliveryTypes();
        $districts          = $this->shop->getAllDistricts();
        $defaultParcelTime = $settings->parcel_time;
        return view('backend.parcel.create', compact('merchants', 'deliveryCategories', 'deliveryCharges', 'deliveryTypes', 'packagings', 'districts', 'defaultParcelTime'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreRequest $request)
    {
        //wallet use checking
        $merchant      = Merchant::find($request->merchant_id);
        if ($merchant->wallet_use_activation == Status::ACTIVE) :
            $chargeDetails = json_decode($request->chargeDetails);
            if ($chargeDetails->totalDeliveryChargeAmount > $merchant->wallet_balance) :
                Toastr::error('This merchant has a low balance.', 'Error');
                return redirect()->back()->withInput($request->all());
            endif;
        endif;
        // end wallet use checking

        if ($this->repo->store($request)) {
            Toastr::success(__('parcel.added_msg'), __('message.success'));
            return redirect()->route('parcel.index');
        } else {
            Toastr::error(__('parcel.error_msg'), __('message.error'));
            return redirect()->back();
        }
    }


    public function duplicateStore(StoreRequest $request)
    {

        if ($this->repo->duplicateStore($request)) {
            Toastr::success(__('parcel.added_msg'), __('message.success'));
            return redirect()->route('parcel.index');
        } else {
            Toastr::error(__('parcel.error_msg'), __('message.error'));
            return redirect()->back();
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }


    // Parcel logs
    public function logs($id)
    {
        $parcel         = $this->repo->get($id);
        $parcelevents   = $this->repo->parcelEvents($id);
        return view('backend.parcel.logs', compact('parcel', 'parcelevents'));
    }

    // Parcel duplicate
    public function duplicate($id)
    {
        $parcel                  = $this->repo->get($id);
        $merchant                = $this->merchant->get($parcel->merchant_id);
        $shops                   = $this->shop->all($parcel->merchant_id);
        $deliveryCharges         = DeliveryCharge::where('category_id', $parcel->category_id)->get();
        $deliveryCategories      = $this->repo->deliveryCategories();
        $deliveryCategoryCharges = $this->repo->deliveryCharges();
        $packagings              = $this->repo->packaging();
        $deliveryTypes           = $this->repo->deliveryTypes();
        return view('backend.parcel.duplicate', compact('parcel', 'merchant', 'shops', 'deliveryCategories', 'deliveryTypes', 'deliveryCategoryCharges', 'deliveryCharges', 'packagings'));
    }

    // Parcel details
    public function details($id)
    {
        // return $this->repo->details($id);
        $parcel         = $this->repo->details($id);
        $parcelevents   = ParcelEvent::where('parcel_id', $id)->orderBy('created_at', 'desc')->get();
        return view('backend.parcel.details', compact('parcel', 'parcelevents'));
    }



    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     */
    public function edit($id)
    {
        $parcel          = $this->repo->get($id);
        $merchant        = $this->merchant->get($parcel->merchant_id);
        $shops           = $this->shop->all($parcel->merchant_id);
        $deliveryCharges = DeliveryCharge::where('category_id', $parcel->category_id)->get();

        $deliveryCategories      = $this->repo->deliveryCategories();
        $deliveryCategoryCharges = $this->repo->deliveryCharges();

        $packagings              = $this->repo->packaging();
        $deliveryTypes      = $this->repo->deliveryTypes();
        $districts          = $this->shop->getAllDistricts();
        $cities = City::query()->select('id', 'name')->where('district_id', $parcel->district_id)->get();
        return view('backend.parcel.edit', compact('parcel', 'merchant', 'shops', 'deliveryCategories', 'deliveryTypes', 'deliveryCategoryCharges', 'deliveryCharges', 'packagings', 'cities', 'districts'));
    }

    // Parcel update
    public function statusUpdate($id, $status_id)
    {
        $this->repo->statusUpdate($id, $status_id);
        Toastr::success(__('parcel.update_msg'), __('message.success'));
        return redirect()->route('parcel.index');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(StoreRequest $request, $id)
    {
        if ($this->repo->update($id, $request)) {
            Toastr::success(__('parcel.update_msg'), __('message.success'));
            return redirect()->route('parcel.index');
        } else {
            Toastr::error(__('parcel.error_msg'), __('message.error'));
            return redirect()->back();
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $this->repo->delete($id);
        Toastr::success(__('parcel.delete_msg'), __('message.success'));
        return back();
    }

    public function parcelImportExport()
    {
        $deliveryCategories = $this->repo->deliveryCategories();

        return view('backend.parcel.import', compact('deliveryCategories'));
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
            $failures     = $e->failures();
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
        Toastr::success(__('parcel.added_msg'), __('message.success'));
        return redirect()->route('parcel.index');
    }

    public function getImportMerchant(Request $request)
    {
        $search   = $request->search;
        $response = array();
        if ($request->searchQuery == 'true') {
            if ($search == '') {
                $merchants = Merchant::where('status', Status::ACTIVE)->orderby('business_name', 'asc')->select('id', 'business_name', 'vat')->where('business_name', 'like', '%' . $search . '%')->limit(10)->get();
            } else {
                $merchants = Merchant::where('status', Status::ACTIVE)->orderby('business_name', 'asc')->select('id', 'business_name', 'vat')->where('business_name', 'like', '%' . $search . '%')->limit(10)->get();
            }

            foreach ($merchants as $merchant) {
                $response[] = array(
                    "id" => $merchant->id,
                    "text" => $merchant->id . ' = ' . $merchant->business_name,
                );
            }
            return response()->json($response);
        }
    }

    public function getMerchant(Request $request)
    {
        $search   = $request->search;
        $response = array();
        if ($request->searchQuery == 'true') {
            // if ($search == '') {
            //     $merchants = [];
            // } else {
            $merchants = Merchant::where('status', Status::ACTIVE)->orderby('business_name', 'asc')->select('id', 'business_name', 'vat')->where('business_name', 'like', '%' . $search . '%')->limit(10)->get();
            // }

            foreach ($merchants as $merchant) {
                $response[] = array(
                    "id" => $merchant->id,
                    "text" => $merchant->business_name,
                );
            }
            return response()->json($response);
        } else {
            $merchant = Merchant::find($search);
            $response[] = array(
                "vat"         => $merchant->vat ?? 0,
                "cod_charges" => $merchant->cod_charges,
            );
            return response()->json($response);
        }
    }


    // Hub search
    public function getHub(Request $request)
    {
        $search   = $request->search;
        $response = array();
        if ($request->searchQuery == 'true') {
            if ($search == '') {
                $hubs = [];
            } else {
                $hubs = Hub::where('status', Status::ACTIVE)->orderby('name', 'asc')->select('id', 'name')->where('name', 'like', '%' . $search . '%')->limit(10)->get();
            }
            foreach ($hubs as $hub) {
                $response[] = array(
                    "id" => $hub->id,
                    "text" => $hub->name,
                );
            }
            return response()->json($response);
        }
    }


    public function getMerchantCod(Request $request)
    {


        if (request()->ajax()) :
            $merchant = [];

            $merchant = Merchant::find($request->merchant_id);

            $merchant = [
                'inside_city'  => $merchant->cod_charges['inside_city'],
                'sub_city' => $merchant->cod_charges['sub_city'],
                'outside_city' => $merchant->cod_charges['outside_city']
            ];
            return response()->json($merchant);
        endif;
        return '';
    }

    public function merchantShops(Request $request)
    {
        if (request()->ajax()) {
            if ($request->id && $request->shop == 'true') {
                $merchantShops          = [];
                $merchantShop           = MerchantShops::where(['merchant_id' => $request->id, 'default_shop' => Status::ACTIVE])->first();
                $merchantShops[]        = $merchantShop;
                $merchantShopArray      = MerchantShops::where(['merchant_id' => $request->id, 'default_shop' => Status::INACTIVE])->get();
                if (!blank($merchantShopArray)) {
                    foreach ($merchantShopArray as $shop) {
                        $merchantShops[] = $shop;
                    }
                }

                if (!blank($merchantShops)) {
                    return view('backend.parcel.shops', compact('merchantShops'));
                }
                return '';
            } else {
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
                $deliveryCharges = DeliveryCharge::where('category_id', $request->category_id)->get();

                if (!blank($deliveryCharges)) {
                    return view('backend.parcel.deliveryWeight', compact('deliveryCharges'));
                }
                return '';
            }
        }
        return '';
    }




    //delivery man search

    public function transferHub(Request $request)
    {


        $parcelEvent = ParcelEvent::where(['parcel_id' => $request->parcel_id, 'parcel_status' => ParcelStatus::RECEIVED_WAREHOUSE])->first();
        $hubs        = Hub::orderByDesc('id')->whereNotIn('id', [$parcelEvent->hub_id])->get();
        $response = '';
        foreach ($hubs as $hub) {
            $response .= '<option value="' . $hub->id . '" selected> ' . $hub->name . '</option>';
        }
        return $response;
    }


    public function deliverymanSearch(Request $request)
    {
        // dd($request->all());
        $search = $request->search;
        if ($request->single) {
            $deliveryMan  = ParcelEvent::where([
                'parcel_id' => $request->parcel_id,
                'parcel_status' => $request->status
            ])->first();

            if (isset($deliveryMan->deliveryMan) && !blank($deliveryMan->deliveryMan)) {
                $response = '<option value="' . $deliveryMan->delivery_man_id . '" selected> ' . $deliveryMan->deliveryMan->user->name . '</option>';
            } else {
                $response = '<option value="' . $deliveryMan->pickup_man_id . '" selected> ' . $deliveryMan->pickupman->user->name . '</option>';
            }
            return $response;
        } else {
            // if ($search == '') {
            //     $deliverymans = [];
            // } else {
            $deliverymans = User::where('status', Status::ACTIVE)
                ->orderby('name', 'asc')
                ->select('id', 'name')
                // ->where('name', 'like', '%' . $search . '%')
                // ->where('user_type', UserType::DELIVERYMAN)->limit(10)->get();
                ->where(function ($query) {
                    if (Auth::user()->id != 1 && Auth::user()->user_type == UserType::ADMIN) :
                        $query->where('hub_id', Auth::user()->hub_id);
                    endif;
                    $query->where('user_type', UserType::DELIVERYMAN);
                })->get();
            // }
            $response = [];
            foreach ($deliverymans as $deliveryman) {
                $response[] = array(
                    "id"  => $deliveryman->deliveryman->id,
                    "text" => $deliveryman->name,
                );
            }
            return response()->json($response);
        }
    }

    //parcel search in recived by hub
    public function parcelRecivedByHubSearch(Request $request)
    {

        if ($request->ajax()) {
            $hub      = $request->hub_id;
            $track_id = $request->track_id;

            if ($track_id && $hub) {
                $parcel      = Parcel::with(['merchant', 'merchant.user'])->where([
                    'tracking_id'     => $request->track_id,
                    'transfer_hub_id' => $hub,
                    'status'          => ParcelStatus::TRANSFER_TO_HUB
                ])->first();
                if ($parcel) {
                    return response()->json($parcel);
                } else {
                    return 0;
                }
            }
        }
    }

    public function transfertohubSelectedHub(Request $request)
    {
        // $transfertohub   = ParcelEvent::where(['parcel_id'=>$request->parcel_id,'parcel_status'=>ParcelStatus::TRANSFER_TO_HUB])->orderBy('id','desc')->first();
        // $hub             = ParcelEvent::where(['parcel_id'=>$request->parcel_id,'parcel_status'=>ParcelStatus::RECEIVED_WAREHOUSE])->first();
        $parcel          = Parcel::find($request->parcel_id);
        if ($parcel) {
            if ($parcel->hub_id) {
                return '<option selected disabled>' . $parcel->hub->name . '</option>';
            } else {
                return '<option selected disabled>Hub not found</option>';
            }
        } else {
            return '<option selected disabled>Hub not found</option>';
        }
    }

    public function PickupManAssigned(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'delivery_man_id' => 'required'
        ]);

        if ($validator->fails()) :
            Toastr::error(__('parcel.required'), __('message.error'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        endif;

        if ($this->repo->pickupdatemanAssigned($request->parcel_id, $request)) {
            Toastr::success(__('parcel.pickup_man_assigned'), __('message.success'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        } else {
            Toastr::error(__('parcel.error_msg'), __('message.error'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        }
    }

    public function collectToPickup(Request $request)
    {
        if ($this->repo->collectToPickup($request->parcel_id, $request)) {
            Toastr::success(__('parcel.collect_to_pickup_success'), __('message.success'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        } else {
            Toastr::error(__('parcel.error_msg'), __('message.error'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        }
    }

    public function PickupManAssignedCancel(Request $request)
    {

        if ($this->repo->pickupdatemanAssignedCancel($request->parcel_id, $request)) {
            Toastr::success(__('parcel.pickup_man_assigned'), __('message.success'));
            return redirect()->back();
        } else {

            Toastr::error(__('parcel.error_msg'), __('message.error'));
            return redirect()->back();
        }
    }

    public function PickupReSchedule(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'delivery_man_id' => 'required',
            'date' => 'required',
        ]);
        if ($validator->fails()) :
            Toastr::error(__('parcel.required'), __('message.error'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        endif;

        if ($this->repo->PickupReSchedule($request->parcel_id, $request)) {
            Toastr::success(__('parcel.pickup_scheduled'), __('message.success'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        } else {
            Toastr::error(__('parcel.error_msg'), __('message.error'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        }
    }

    public function PickupReScheduleCancel(Request $request)
    {

        if ($this->repo->PickupReScheduleCancel($request->parcel_id, $request)) {
            Toastr::success(__('parcel.pickup_reschedule_canceled'), __('message.success'));
            return redirect()->back();
        } else {

            Toastr::error(__('parcel.error_msg'), __('message.error'));
            return redirect()->back();
        }
    }


    public function receivedBypickupman(Request $request)
    {

        if ($this->repo->receivedBypickupman($request->parcel_id, $request)) {
            Toastr::success(__('parcel.received_by_pickup_success'), __('message.success'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        } else {
            Toastr::error(__('parcel.error_msg'), __('message.error'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        }
    }



    public function receivedByHub(Request $request)
    {

        if ($this->repo->receivedByHub($request->parcel_id, $request)) {
            Toastr::success(__('parcel.received_by_hub'), __('message.success'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        } else {
            Toastr::error(__('parcel.error_msg'), __('message.error'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        }
    }



    public function receivedByHubCancel(Request $request)
    {

        if ($this->repo->receivedByHubCancel($request->parcel_id, $request)) {
            Toastr::success(__('parcel.received_by_hub_cancel'), __('message.success'));
            return redirect()->back();
        } else {
            Toastr::error(__('parcel.error_msg'), __('message.error'));
            return redirect()->back();
        }
    }




    public function receivedBypickupmanCancel(Request $request)
    {

        if ($this->repo->receivedBypickupmanCancel($request->parcel_id, $request)) {
            Toastr::success(__('parcel.received_by_pickup_cancel_success'), __('message.success'));
            return redirect()->back();
        } else {
            Toastr::error(__('parcel.error_msg'), __('message.error'));
            return redirect()->back();
        }
    }


    public function search(Request $data)
    {
        return $this->repo->search($data);
    }

    public function searchDeliveryManAssingMultipleParcel(Request $data)
    {
        return $this->repo->searchDeliveryManAssingMultipleParcel($data);
    }

    public function searchExpense(Request $data)
    {
        return $this->repo->searchExpense($data);
    }

    public function searchIncome(Request $data)
    {
        return $this->repo->searchIncome($data);
    }



    public function transferToHubMultipleParcel(Request $request)
    {


        $validator = Validator::make($request->all(), [
            'hub_id'     => 'required',
            'parcel_ids' => 'required',
        ]);
        if ($validator->fails()) :
            Toastr::error(__('parcel.required'), __('message.error'));
            return redirect(paginate_redirect($request));
        endif;

        if ($this->repo->transferToHubMultipleParcel($request)) {
            Toastr::success(__('parcel.transfer_to_hub_success'), __('message.success'));

            $deliveryman    = $this->deliveryman->get($request->delivery_man_id);
            $parcels        = $this->repo->bulkParcels($request->parcel_ids);
            $bulk_type      = ParcelStatus::TRANSFER_TO_HUB;
            $transfered_hub = Hub::find($request->hub_id);
            return view('backend.parcel.bulk_print', compact('parcels', 'deliveryman', 'bulk_type', 'transfered_hub'));
        } else {
            Toastr::error(__('parcel.error_msg'), __('message.error'));
            return redirect(paginate_redirect($request));
        }
    }


    public function deliveryManAssignMultipleParcel(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'delivery_man_id' => 'required',
            'parcel_ids_'     => 'required',
        ]);
        if ($validator->fails()) :
            Toastr::error(__('parcel.required'), __('message.error'));
            return redirect(paginate_redirect($request));
        endif;

        if ($this->repo->deliveryManAssignMultipleParcel($request)) {
            Toastr::success(__('parcel.delivery_man_assign_success'), __('message.success'));
            $deliveryman = $this->deliveryman->get($request->delivery_man_id);
            $parcels    = $this->repo->bulkParcels($request->parcel_ids_);
            $bulk_type  = ParcelStatus::DELIVERY_MAN_ASSIGN;
            return view('backend.parcel.bulk_print', compact('parcels', 'deliveryman', 'bulk_type'));
        } else {
            Toastr::error(__('parcel.error_msg'), __('message.error'));
            return redirect(paginate_redirect($request));
        }
    }


    public function ParcelBulkAssignPrint(Request $request)
    {
        try {

            $deliveryman  = $this->deliveryman->get($request->delivery_man_id);
            $parcels      = $this->repo->bulkParcels($request->parcels);
            $bulk_type    = ParcelStatus::DELIVERY_MAN_ASSIGN;
            $reprint = true;
            return view('backend.parcel.bulk_print', compact('parcels', 'deliveryman', 'bulk_type', 'reprint'));
        } catch (Throwable $th) {
            Toastr::error(__('parcel.error_msg'), __('message.error'));
            return redirect()->back();
        }
    }




    public function transfertohub(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'hub_id' => 'required'
        ]);
        if ($validator->fails()) :
            Toastr::error(__('parcel.error_msg'), __('message.error'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        endif;

        if ($this->repo->transfertohub($request->parcel_id, $request)) {
            Toastr::success(__('parcel.transfer_to_hub_success'), __('message.success'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        } else {
            Toastr::error(__('parcel.error_msg'), __('message.error'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        }
    }


    public function transfertoHubCancel(Request $request)
    {

        if ($this->repo->transfertoHubCancel($request->parcel_id, $request)) {
            Toastr::success(__('parcel.transfer_to_hub_canceled'), __('message.success'));
            return redirect()->back();
        } else {
            Toastr::error(__('parcel.error_msg'), __('message.error'));
            return redirect()->back();
        }
    }





    public function deliverymanAssign(Request $request)
    {


        $validator = Validator::make($request->all(), [
            'delivery_man_id' => 'required'
        ]);
        if ($validator->fails()) :
            Toastr::error(__('parcel.required'), __('message.error'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        endif;

        if ($this->repo->deliverymanAssign($request->parcel_id, $request)) {
            Toastr::success(__('parcel.delivery_man_assign_success'), __('message.success'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        } else {
            Toastr::error(__('parcel.error_msg'), __('message.error'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        }
    }


    public function deliverymanAssignCancel(Request $request)
    {

        if ($this->repo->deliverymanAssignCancel($request->parcel_id, $request)) {
            Toastr::success(__('parcel.deliveryman_assign_cancel'), __('message.success'));
            return redirect()->back();
        } else {
            Toastr::error(__('parcel.error_msg'), __('message.error'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect()->back();
        }
    }



    public function deliveryReschedule(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'delivery_man_id' => 'required',
            'date'           => 'required'
        ]);
        if ($validator->fails()) :
            Toastr::error(__('parcel.required'), __('message.error'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        endif;

        if ($this->repo->deliveryReschedule($request->parcel_id, $request)) {
            Toastr::success(__('parcel.delivery_reschedule_success'), __('message.success'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        } else {
            Toastr::error(__('parcel.error_msg'), __('message.error'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        }
    }


    public function deliveryReScheduleCancel(Request $request)
    {

        if ($this->repo->deliveryReScheduleCancel($request->parcel_id, $request)) {
            Toastr::success(__('parcel.delivery_re_schedule_cancel'), __('message.success'));
            return redirect()->back();
        } else {

            Toastr::error(__('parcel.error_msg'), __('message.error'));
            return redirect()->back();
        }
    }



    public function receivedWarehouse(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'hub_id' => 'required'
        ]);
        if ($validator->fails()) :
            Toastr::error(__('parcel.required'), __('message.error'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        endif;

        if ($this->repo->receivedWarehouse($request->parcel_id, $request)) {
            Toastr::success(__('parcel.received_warehouse_success'), __('message.success'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        } else {
            Toastr::error(__('parcel.error_msg'), __('message.error'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        }
    }


    public function receivedWarehouseCancel(Request $request)
    {

        if ($this->repo->receivedWarehouseCancel($request->parcel_id, $request)) {
            Toastr::success(__('parcel.received_warehouse_cancel'), __('message.success'));
            return redirect()->back();
        } else {

            Toastr::error(__('parcel.error_msg'), __('message.error'));
            return redirect()->back();
        }
    }

    public function parcelBranchCancel(Request $request)
    {
        if ($this->repo->parcelBranchCancel($request->parcel_id, $request)) {
            Toastr::success(__('parcel.branch_cancel'), __('message.success'));
            return redirect()->back();
        } else {
            Toastr::error(__('parcel.error_msg'), __('message.error'));
            return redirect()->back();
        }
    }

    public function returntoQourier(Request $request)
    {
        if ($this->repo->returntoQourier($request->parcel_id, $request)) {
            Toastr::success(__('parcel.return_to_qourier_success'), __('message.success'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        } else {
            Toastr::error(__('parcel.error_msg'), __('message.error'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        }
    }



    public function returntoQourierCancel(Request $request)
    {

        if ($this->repo->returntoQourierCancel($request->parcel_id, $request)) {
            Toastr::success(__('parcel.received_warehouse_cancel'), __('message.success'));
            return redirect()->back();
        } else {

            Toastr::error(__('parcel.error_msg'), __('message.error'));
            return redirect()->back();
        }
    }





    public function returnAssignToMerchant(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'delivery_man_id' => 'required',
            'date'           => 'required'

        ]);
        if ($validator->fails()) :
            toast(__('parcel.required'), 'error');
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        endif;
        if ($this->repo->returnAssignToMerchant($request->parcel_id, $request)) {
            Toastr::success(__('parcel.return_assign_to_merchant_success'), __('message.success'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        } else {
            Toastr::error(__('parcel.error_msg'), __('message.error'));
            return redirect(paginate_redirect($request));
        }
    }



    public function returnAssignToMerchantCancel(Request $request)
    {

        if ($this->repo->returnAssignToMerchantCancel($request->parcel_id, $request)) {
            Toastr::success(__('parcel.return_assign_to_merchant_cancel_success'), __('message.success'));
            return redirect()->back();
        } else {

            Toastr::error(__('parcel.error_msg'), __('message.error'));
            return redirect()->back();
        }
    }
    public function returnAssignToMerchantReschedule(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'delivery_man_id' => 'required',
            'date'           => 'required'

        ]);
        if ($validator->fails()) :
            Toastr::error(__('parcel.required'), __('message.error'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        endif;

        if ($this->repo->returnAssignToMerchantReschedule($request->parcel_id, $request)) {
            Toastr::success(__('parcel.return_assign_to_merchant_reschedule_success'), __('message.success'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        } else {
            Toastr::error(__('parcel.error_msg'), __('message.error'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        }
    }



    public function returnAssignToMerchantRescheduleCancel(Request $request)
    {

        if ($this->repo->returnAssignToMerchantRescheduleCancel($request->parcel_id, $request)) {
            Toastr::success(__('parcel.return_assign_to_merchant_reschedule_cancel_success'), __('message.success'));
            return redirect()->back();
        } else {

            Toastr::error(__('parcel.error_msg'), __('message.error'));
            return redirect()->back();
        }
    }



    public function returnReceivedByMerchant(Request $request)
    {
        if ($this->repo->returnReceivedByMerchant($request->parcel_id, $request)) {
            Toastr::success(__('parcel.return_received_by_merchant'), __('message.success'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        } else {
            Toastr::error(__('parcel.error_msg'), __('message.error'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        }
    }


    public function returnReceivedByMerchantCancel(Request $request)
    {

        if ($this->repo->returnReceivedByMerchantCancel($request->parcel_id, $request)) {
            Toastr::success(__('parcel.return_received_by_merchant_cancel_success'), __('message.success'));
            return redirect()->back();
        } else {

            Toastr::error(__('parcel.error_msg'), __('message.error'));
            return redirect()->back();
        }
    }






    public function parcelDelivered(Request $request)
    {
        if ($this->repo->parcelDelivered($request->parcel_id, $request)) {
            Toastr::success(__('parcel.delivered_success'), __('message.success'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        } else {
            Toastr::error(__('parcel.error_msg'), __('message.error'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        }
    }


    public function parcelDeliveredCancel(Request $request)
    {

        if ($this->repo->parcelDeliveredCancel($request->parcel_id, $request)) {
            Toastr::success(__('parcel.delivered_cancel'), __('message.success'));
            return redirect()->back();
        } else {
            Toastr::error(__('parcel.error_msg'), __('message.error'));
            return redirect()->back();
        }
    }




    public function parcelPartialDelivered(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'cash_collection'       => 'required',
        ]);

        if ($validator->fails()) {
            Toastr::error(__('parcel.required'), __('message.error'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        }

        if ($this->repo->parcelPartialDelivered($request->parcel_id, $request)) {
            Toastr::success(__('parcel.partial_delivered_success'), __('message.success'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        } else {
            Toastr::error(__('parcel.error_msg'), __('message.error'));
            if ($request->filter == 'on') :
                return redirect()->back();
            endif;
            return redirect(paginate_redirect($request));
        }
    }


    public function parcelPartialDeliveredCancel(Request $request)
    {
        if ($this->repo->parcelPartialDeliveredCancel($request->parcel_id, $request)) {
            Toastr::success(__('parcel.partial_delivered_cancel'), __('message.success'));
            return redirect()->back();
        } else {
            Toastr::error(__('parcel.error_msg'), __('message.error'));
            return redirect()->back();
        }
    }


    public function parcelPrint($id)
    {

        $parcel = $this->repo->get($id);
        $merchant = $this->merchant->get($parcel->merchant_id);
        $shops = $this->shop->all($parcel->merchant_id);
        return view('backend.parcel.print', compact('parcel', 'merchant', 'shops'));
    }

    public function parcelPrintLabel($id)
    {
        $parcel = $this->repo->get($id);
        $merchant = $this->merchant->get($parcel->merchant_id);
        $shops = $this->shop->all($parcel->merchant_id);
        $merchantLogo = $parcel->merchant->user->getImageAttribute();
        return view('backend.parcel.print-label', compact('parcel', 'merchant', 'shops', 'merchantLogo'));
    }


    //multiple parcel label print
    public function parcelMultiplePrintLabel(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'parcels' => 'required'
        ]);
        if ($validator->fails()) :
            Toastr::error('Must be select parcel.', __('message.error'));
            return redirect()->back();
        endif;
        $parcels = $this->repo->parcelMultiplePrintLabel($request);
        return view('backend.parcel.multiple-print-label', compact('parcels'));
    }
    //end multiple parcel label print

    public function parcelReceivedByMultipleHub(Request $request)
    {
        if ($this->repo->parcelReceivedByMultipleHub($request->parcel_id, $request)) {
            Toastr::success(__('parcel.received_by_multiple_hub'), __('message.success'));
            return redirect(paginate_redirect($request));
        } else {
            Toastr::error(__('parcel.error_msg'), __('message.error'));
            return redirect(paginate_redirect($request));
        }
    }


    //Assign pickup bulk

    public function AssignPickupParcelSearch(Request $request)
    {
        if ($request->ajax()) {
            $merchant_id      = $request->merchant_id;
            $tracking_id      = $request->tracking_id;

            if ($merchant_id !== null && $tracking_id !== null) {

                $parcel      = Parcel::with(['merchant', 'merchant.user'])->where([
                    'merchant_id'     => $merchant_id,
                    'tracking_id'     => $tracking_id,
                    'status'          => ParcelStatus::PENDING
                ])->first();

                if ($parcel) {
                    return response()->json($parcel);
                } else {
                    return 0;
                }
            } else {

                return 0;
            }
        }

        return 0;
    }




    //assign pickup bulk store
    public function AssignPickupBulk(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'merchant_id'       => 'required',
            'delivery_man_id'   => 'required'
        ]);

        if ($validator->fails()) {
            Toastr::error(__('parcel.feild_required'), __('message.error'));
            return redirect(paginate_redirect($request));
        }

        if ($this->repo->pickupdatemanAssignedBulk($request)) {
            Toastr::success(__('parcel.pickup_man_assigned'), __('message.success'));
            return redirect(paginate_redirect($request));
        } else {
            Toastr::error(__('parcel.error_msg'), __('message.error'));
            return redirect(paginate_redirect($request));
        }
    }


    //assign return to merchant

    //return to courier percel will be show
    public function AssignReturnToMerchantParcelSearch(Request $request)
    {
        if ($request->ajax()) {
            $merchant_id      = $request->merchant_id;
            $tracking_id      = $request->tracking_id;

            if ($merchant_id !== null && $tracking_id !== null) {

                $parcel      = Parcel::with(['merchant', 'merchant.user'])->where([
                    'merchant_id'     => $merchant_id,
                    'tracking_id'     => $tracking_id,
                    'status'          => ParcelStatus::RETURN_TO_COURIER
                ])->first();

                if ($parcel) {
                    return response()->json($parcel);
                } else {
                    return 0;
                }
            } else {

                return 0;
            }
        }

        return 0;
    }


    //assign return to merchant bulk store
    public function AssignReturnToMerchantBulk(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'merchant_id'       => 'required',
            'delivery_man_id'   => 'required',
            'date'              => 'required'
        ]);

        if ($validator->fails()) {
            Toastr::error(__('parcel.feild_required'), __('message.error'));
            return redirect(paginate_redirect($request));
        }


        if ($this->repo->AssignReturnToMerchantBulk($request)) {
            Toastr::success(__('parcel.return_assign_to_merchant_success'), __('message.success'));

            $deliveryman    = $this->deliveryman->get($request->delivery_man_id);
            $parcels        = $this->repo->bulkParcels($request->parcel_ids);
            $bulk_type      = ParcelStatus::RETURN_ASSIGN_TO_MERCHANT;
            return view('backend.parcel.bulk_print', compact('parcels', 'deliveryman', 'bulk_type'));
        } else {
            Toastr::error(__('parcel.error_msg'), __('message.error'));
            return redirect(paginate_redirect($request));
        }
    }


    //received warehouse hub auto selected
    public function warehouseHubSelected(Request $request)
    {
        $hubs_list  = "";
        $hubs_list .= "<option>" . __("menus.select") . " " . __("hub.title") . "</option>";

        if ($request->hub_id) :
            $hubs = Hub::all();
            foreach ($hubs as $hub) {

                if ($hub->id == $request->hub_id) {
                    $hubs_list .= "<option selected value=" . $hub->id . " >" . $hub->name . "</option>";
                } else {
                    $hubs_list .= "<option   value='" . $hub->id . "' >" . $hub->name . "</option>";
                }
            }
        else :
            $hubs = Hub::all();
            foreach ($hubs as $key => $hub) {

                $hubs_list .= "<option   value='" . $hub->id . "' >" . $hub->name . "</option>";
            }
        endif;

        return $hubs_list;
    }


    public function ParcelSearchs(Request $request)
    {

        if ($this->repo->parcelSearchs($request)) {
            $parcels          = $this->repo->parcelSearchs($request);
            $deliverymans = $this->deliveryman->all();
            $hubs         = $this->hub->all();
            // $request['search']='on';
            return view('backend.parcel.index', compact('parcels', 'request', 'deliverymans', 'hubs'));
        } else {
            return redirect()->back();
        }
    }


    //parcel sample export
    public function parcelSampleExport()
    {
        return Excel::download(new ParcelSampleExport, 'invoice.xlsx');
    }



    public function priorityUpdate(Request $request)
    {

        $parcel = Parcel::where(['id' => $request->id])->first();
        if (1 == (int)$request->priority) {
            $parcel->priority_type_id      =  2;
        } else {
            $parcel->priority_type_id      =  1;
        }
        $parcel->save();

        return $parcel;
    }
    // Parcel parcelDeliveryMan
    public function parcelDeliveryMan()
    {
        $parcelEvents = ParcelEvent::with('parcel')->whereNotNull('delivery_man_id')->where('parcel_status', ParcelStatus::DELIVERY_MAN_ASSIGN)->get();
        $mapParcels = [];
        if (!blank($parcelEvents)) {
            foreach ($parcelEvents as $key => $parcelEvent) {
                $mapParcels[$key]['deliveryMan'] = optional($parcelEvent->deliveryMan->user)->name;
                $mapParcels[$key]['deliveryPhone'] = optional($parcelEvent->deliveryMan->user)->mobile;
                $mapParcels[$key]['deliveryImage'] = optional($parcelEvent->deliveryMan->user)->image;
                $mapParcels[$key]['lat'] = $parcelEvent->delivery_lat;
                $mapParcels[$key]['long'] = $parcelEvent->delivery_long;
                $mapParcels[$key]['customer_name'] = $parcelEvent->parcel->customer_name;
                $mapParcels[$key]['customer_address'] = $parcelEvent->parcel->customer_address;
                $mapParcels[$key]['customer_phone'] = $parcelEvent->parcel->customer_phone;
                $mapParcels[$key]['merchant_business_name'] = $parcelEvent->parcel->merchant->business_name;
                $mapParcels[$key]['merchant_phone'] = $parcelEvent->parcel->merchant->user->mobile;
                $mapParcels[$key]['merchant_address'] = $parcelEvent->parcel->merchant->address;
                $mapParcels[$key]['current_payable'] = $parcelEvent->parcel->current_payable;
                $mapParcels[$key]['tracking_id'] = $parcelEvent->parcel->tracking_id;
                $mapParcels[$key]['url'] = route('parcel.logs', $parcelEvent->parcel->id);
            }
        }
        return view('backend.parcel.parcel-map-logs', compact('mapParcels'));
    }

    public function deliveredInfo($id)
    {
        $parcel         = $this->repo->get($id);
        $parcelevents   = $this->repo->parcelEvents($id);
        return view('backend.parcel.parcel-delivered-info', compact('parcel', 'parcelevents'));
    }
}
