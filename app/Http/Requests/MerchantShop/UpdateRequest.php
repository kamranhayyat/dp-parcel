<?php

namespace App\Http\Requests\MerchantShop;

use Illuminate\Foundation\Http\FormRequest;

class UpdateRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'merchant_id'=>['required'],
            'name'       =>['required'],
            'contact_no' =>['required','numeric','digits_between:9,20'],
            'address'    =>['required'],
            'status'     =>['required'],
            'district_id'   =>['required'],
            'city_id'   =>['required']
        ];
    }
}
