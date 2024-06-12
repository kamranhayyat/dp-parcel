<?php

namespace App\Http\Requests\Merchant;

use Illuminate\Foundation\Http\FormRequest;

class StoreRequest extends FormRequest
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
        $target = '';
        $discount ='';
        if(request()->is_agreement):
            $target   = ['required'];
            $discount = ['required'];
        endif;
        return [
            'name'                  => ['required','string','max:191'],
            'business_name'         => ['required','string','unique:merchants'],
            'mobile'                => ['required','numeric','digits_between:9,20','unique:users'],
            // 'email'                 => ['required','string','unique:users'],
            'hub'                   => ['required','numeric'],
            'status'                => ['required','numeric'],
            'password'              => ['required','min:6'],
            'address'               => ['required','string','max:191'],
            'payment_period'        => ['numeric'],
            'agreement_file'        => ['max:20480'], 
            'target'          => $target,
            'discount'        => $discount


        ];
    }

    public function attributes() 
    {
        return [
            'payment_period'=> ['invoice setteld']
        ];
    }
}
