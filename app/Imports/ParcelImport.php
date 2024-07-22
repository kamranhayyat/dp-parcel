<?php

namespace App\Imports;

use App\Enums\ApprovalStatus;
use App\Enums\ParcelStatus;
use App\Enums\DeliveryType;
use App\Enums\DeliveryTime;
use App\Enums\Status;
use App\Models\Backend\DeliveryCharge;
use App\Models\Backend\Merchant;
use App\Models\Backend\MerchantDeliveryCharge;
use App\Models\Backend\Packaging;
use App\Models\Backend\Parcel;
use App\Models\City;
use App\Models\District;
use App\Models\MerchantShops;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\SkipsEmptyRows;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithValidation;

use Illuminate\Support\Str;


class ParcelImport implements ToModel, WithHeadingRow ,WithValidation , SkipsEmptyRows
{
    use Importable;
    /**
     * @param array $row
     *
     * @return \Illuminate\Database\Eloquent\Model|null
     */
    public function model(array $row)
    {
        if(isset($row['merchant_id']) && !blank($row['merchant_id'])) {
            $merchant = Merchant::where('id',$row['merchant_id'])->first();
        }else {
            $merchant = Merchant::where('user_id',auth()->user()->id)->first();
        }

        $delivery_type_id = 'normal';
        $merchantshop     = MerchantShops::where(['merchant_id'=>$merchant->id,'default_shop'=>Status::ACTIVE])->first();

        if(auth()->user()->merchant):
            $category_id      = 1;
            $liquid_fragile   = null;
            $packaging_id     = null;
            $shop_id          = $merchantshop->id;
            $pickup_phone     = $merchantshop->contact_no;
            $pickup_address   = $merchantshop->address;
            $pickup_lat       = $merchantshop->merchant_lat;
            $pickup_long      = $merchantshop->merchant_long;
        else:
            $category_id      = $row['category_id'];
            $liquid_fragile   = $row['liquid_fragile'];
            $packaging_id     = $row['packaging_id'];
            $shop_id          = $row['shop_id'];
            $pickup_phone     = $row['pickup_phone'];
            $pickup_address   = $row['pickup_address'];

        endif;

        $deliveryDistrict = District::query()->where('sector', $row['delivery_territory'])->first();
        $deliveryCity = City::query()->where('name', $row['territory_city'])->first();

        $deliveryChargeAmount = $this->deliveryCharge($merchantshop->district_id, $deliveryDistrict, $row['weight']);
        $codChargeAmount      = $this->codCharge($merchant,$row['cash_collection'],$delivery_type_id);
        $liquidFragileAmount  = null;
        $packagingAmount      = 0;
        $codAmount            = $codChargeAmount['codAmount'];
        $merchantCodCharge    = $codChargeAmount['merchantCodCharge'];
        $vat                  = $merchant->vat;
        if($liquid_fragile){
            $liquidFragileAmount = SettingHelper('fragile_liquid_charge');
        }
        if(!blank($packaging_id)){
            $packagingAmount     = Packaging::findOrFail($row['packaging_id'])->price ?? 0;
        }
        $totalParcelAmount  = ($deliveryChargeAmount+$codAmount+$liquidFragileAmount+$packagingAmount);
        $vatTextAmount      = $this->percentage($totalParcelAmount,$vat);
        $totalCurrentAmount = ($row['cash_collection']-$totalParcelAmount)-$vatTextAmount;

        $deliveryTime = [
            'pickup'       =>date('Y-m-d'),
            'delivery'     =>date('Y-m-d'),
        ];

        $n = (int)floor(microtime(true) * 1000) % 1000000000;
        $parcels = [
            'merchant_id'       => $merchant->id,
            'first_hub_id'      => $merchant->user->hub_id,
            'hub_id'            => $merchant->user->hub_id,
            'category_id'       => $category_id,
            'weight'            => $row['weight'],
            'invoice_no'        => $row['invoice_no'],
            'cash_collection'   => $row['cash_collection'],
            'selling_price'     => $row['selling_price'],
            'merchant_shop_id'  => $shop_id,
            'pickup_phone'      => $pickup_phone,
            'pickup_address'    => $pickup_address,
            'customer_name'     => $row['customer_name'],
            'customer_phone'    => $row['customer_phone'],
            'customer_address'  => $row['customer_address'],
            'customer_lat'      => $row['customer_lat'],
            'customer_long'     => $row['customer_long'],
            'delivery_type_id'  => $delivery_type_id,
            'pickup_date'       => $deliveryTime['pickup'],
            'delivery_date'     => $deliveryTime['delivery'],
            'vat'               => $vat,
            'vat_amount'        => $vatTextAmount,
            'delivery_charge'   => $deliveryChargeAmount,
            'cod_charge'        => $merchantCodCharge,
            'cod_amount'        => $codAmount,
            'total_delivery_amount'=> $totalParcelAmount,
            'current_payable'   => $totalCurrentAmount,
            'tracking_id'       =>  Str::upper(settings()->par_track_prefix). $n .'C'.$merchant->id. $shop_id,
            'note'              => $row['note'],
            'packaging_id'      => $packaging_id,
            'packaging_amount'  => $packagingAmount,
            'district_id'  => $deliveryDistrict->id,
            'city_id'  => $deliveryCity->id,
            'liquid_fragile_amount' => $liquidFragileAmount,
            'status'            => ParcelStatus::PENDING,
            'created_at'        =>date('Y-m-d H:i:s'),
            'updated_at'        =>date('Y-m-d H:i:s'),
        ];
        $parcel = Parcel::create($parcels);
        return $parcel;
    }

    public function rules(): array
    {
        if(auth()->user()->merchant):
            $shop_id           = ['numeric'];
            $category_id       = ['numeric'];
        else:
            $shop_id           = ['required','numeric'];
            $category_id       = ['required','numeric'];
        endif;
        return [
            'shop_id'           => $shop_id,
            'cash_collection'   => ['required','numeric'],
            'category_id'       => $category_id,
            'customer_name'     => ['required','string','max:191'],
            'customer_address'  => ['required','string','max:191'],
        ];
    }

    private function deliveryCharge($pickup_district_id, $deliveryDistrict,$weight)
    {
        $pickUpDistrict = District::query()->where('id', $pickup_district_id)->first();
        $subCategory = null;

        if($pickUpDistrict->id === $deliveryDistrict->id && $pickUpDistrict->number != "1") {
            $subCategory = 'same_sector';
        } else if($pickUpDistrict->number == "1" && $deliveryDistrict->number == "1") {
            $subCategory = $deliveryDistrict->sector;
        } else if($pickUpDistrict->id !== $deliveryDistrict->id &&
            $pickUpDistrict->number !== $deliveryDistrict->number) {
            $subCategory = 'different_sector';
        }

        $deliveryCharge = DeliveryCharge::query()
            ->where('category', 'normal')
            ->where('sub_category', $subCategory)
            ->first();

        if (!$deliveryCharge) {
            return new ModelNotFoundException('Delivery charge not found');
        }

        $deliveryChargeOtherKgRate = 0;
        $deliveryChargeFirstKgRate = $deliveryCharge->first_kg;
        if($weight > 1) {
            $deliveryChargeOtherKgRate = ($weight - 1) * $deliveryCharge->other_kg;
        }

        return  $deliveryChargeFirstKgRate + $deliveryChargeOtherKgRate;
    }

    private function codCharge($merchant,$cash_collection,$delivery_type_id)
    {
        $data = [];
        $data['merchantCodCharge'] = 0;
        $data['codAmount'] = 0;

        if($delivery_type_id !=='' && $delivery_type_id =='1' || $delivery_type_id =='2'){
            $data['merchantCodCharge'] = $merchant->cod_charges['inside_city'];
            $data['codAmount'] = $this->percentage($cash_collection, $merchant->cod_charges['inside_city']);
        }else if($delivery_type_id !='' && $delivery_type_id =='3'){
            $data['merchantCodCharge'] = $merchant->cod_charges['sub_city'];
            $data['codAmount'] = $this->percentage($cash_collection, $merchant->cod_charges['sub_city']);
        }else if($delivery_type_id !='' && $delivery_type_id =='4') {
            $data['merchantCodCharge'] = $merchant->cod_charges['outside_city'];
            $data['codAmount'] = $this->percentage($cash_collection, $merchant->cod_charges['outside_city']);
        }else {
            $data['merchantCodCharge'] = 0;
            $data['codAmount'] = $this->percentage($cash_collection, 0);
        }
        return $data;
    }

    private function percentage($cash_collection,$cod_charges){
        return $cash_collection * ($cod_charges / 100);
    }
}
