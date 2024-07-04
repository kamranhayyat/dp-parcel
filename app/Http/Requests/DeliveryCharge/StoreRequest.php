<?php

namespace App\Http\Requests\DeliveryCharge;

use Illuminate\Database\Query\Builder;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

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
        $rules = [
            'category' => [
                'required',
                'in:express,same_day,normal',
                Rule::unique('delivery_charges')->where(function (Builder $query) {
                    return $query->whereIn('category', ['express', 'same_day']);
                })
            ],
            'sub_category' => [
                'required_if:category,normal',
                'in:same_sector,different_sector,Colombo 1-15,Colombo Suburbs,Greater Colombo',
                'nullable',
                Rule::unique('delivery_charges')->where(function (Builder $query) {
                    return $query->where('category', $this->input('category'));
                })
            ],
            'first_kg' => ['required', 'numeric'],
            'other_kg' => ['required', 'numeric'],
            'status' => ['required', 'numeric'],
        ];

        $categorySlug = $this->input('category_slug');

        switch ($categorySlug) {
            case 'same_day':
            case 'express':
                $rules['time'] = ['required', 'date_format:H:i'];
                break;
        }

        return $rules;
    }
}
