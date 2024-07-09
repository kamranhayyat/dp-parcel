<?php

namespace App\Models\Backend;

use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Enums\Status;
use App\Models\Backend\Deliverycategory;
use Illuminate\Support\Carbon;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

class DeliveryCharge extends Model
{
    use HasFactory,LogsActivity;


    protected $fillable = [
        'category',
        'sub_category',
        'first_kg',
        'other_kg',
        'time',
        'weight',
        'same_day',
        'next_day',
        'sub_city',
        'outside_city',
        'position',
        'status',
    ];

        protected $casts = [];

        public function getActivitylogOptions(): LogOptions
        {

            $logAttributes = [
                'category.name',
                'weight',
                'same_day',
                'next_day',
                'sub_city',
                'outside_city',
                'position',
            ];
            return LogOptions::defaults()
            ->useLogName('DeliveryCharge')
            ->logOnly($logAttributes)
                ->setDescriptionForEvent(fn(string $eventName) => "{$eventName}");
        }


    public function getMyStatusAttribute()
    {
        if($this->status == Status::ACTIVE){
            $status = '<span class="badge badge-pill badge-success">'.trans("status." . $this->status).'</span>';
        }else {
            $status = '<span class="badge badge-pill badge-danger">'.trans("status." . $this->status).'</span>';
        }
        return $status;
    }

    /**
     * Cast time to 24h format
     *
     * @return Attribute
     */
    protected function time(): Attribute
    {
        return new Attribute(
            get: fn ($value) => Carbon::parse($value)->format('H:i'),
        );
    }

     public static function category()
     {
         return [
             'express' => 'Express',
             'same_day' => 'Same Day',
             'normal' => 'Normal',
         ];
     }

     public static function subCategory()
     {
         return [
             'same_sector' => 'Same District',
             'different_sector' => 'Different District',
             'Colombo 1-15' => 'Colombo 1-15 to Colombo 1-15 ',
             'Colombo Suburbs' => 'Colombo 1-15 to Colombo Suburbs',
             'Greater Colombo' => 'Colombo 1-15 to Greater Colombo'
         ];
     }
}
