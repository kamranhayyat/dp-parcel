<?php

namespace App\Models\Backend;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Enums\Status;
use App\Models\Backend\Deliverycategory;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

class DeliveryCharge extends Model
{
    use HasFactory,LogsActivity;


        protected $fillable = [
                'category_id',
                'weight',
                'same_day',
                'next_day',
                'sub_city',
                'outside_city',
                'position',
            ];

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
             'within_sector' => 'Within District',
             'different_sector' => 'Different District',
         ];
     }
}
