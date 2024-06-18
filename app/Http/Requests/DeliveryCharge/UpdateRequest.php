<?php

namespace App\Http\Requests\DeliveryCharge;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

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
        $rules = [
            'category'    => ['required', 'string'],
            'first_kg'    => ['required', 'numeric'],
            'other_kg'    => ['required', 'numeric'],
            'status'      => ['required', 'numeric'],
        ];

        $categorySlug = $this->input('category_slug');

        switch ($categorySlug) {
            case 'same_day':
            case 'express':
                $rules['time'] = ['required', 'numeric'];
                break;
            case 'normal':
                $rules['sub_category'] = ['required', 'string'];
                break;
        }

        return $rules;
    }
}
