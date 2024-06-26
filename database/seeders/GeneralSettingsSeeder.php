<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Backend\GeneralSettings;
use App\Models\Backend\Upload;

class GeneralSettingsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $user           = new Upload();
        $user->original = "uploads/users/user8.png";
        $user->save();

        $user           = new Upload();
        $user->original = "uploads/users/user9.png";
        $user->save();


        $row               = new GeneralSettings();
        $row->name         = "We Courier";
        $row->phone        = "20022002";
        $row->email        = "info@wecourier.com";
        $row->address      = "Mirpur 10, Dhaka, Bangladesh";
        $row->currency     = "$";
        $row->copyright    = "Copyright © All rights reserved. Development by WemaxDevs.";
        $row->logo         = 8;
        $row->favicon      = 9;
        $row->par_track_prefix     = 'we';
        $row->invoice_prefix       = 'we';
        $row->current_version      = '1';
        $row->primary_color        = '#0138a8';
        $row->text_color           = '#ffffff';
        $row->parcel_time           = \Illuminate\Support\Carbon::parse('3pm')->format('H:i');
        $row->save();
        return $row;
    }
}
