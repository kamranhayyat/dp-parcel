<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DistrictsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $districts = [
            ['number' => '1', 'sector' => 'Colombo 1-15'],
            ['number' => '1', 'sector' => 'Colombo Suburbs'],
            ['number' => '1', 'sector' => 'Greater Colombo'],

            ['number' => '2', 'sector' => 'Gampaha'],
            ['number' => '3', 'sector' => 'Kalutara'],
            ['number' => '4', 'sector' => 'Kandy'],
            ['number' => '5', 'sector' => 'Matale'],
            ['number' => '6', 'sector' => 'Nuwara Eliya'],
            ['number' => '7', 'sector' => 'Galle'],
            ['number' => '8', 'sector' => 'Matara'],
            ['number' => '9', 'sector' => 'Hambantota'],
            ['number' => '10', 'sector' => 'Jaffna'],
            ['number' => '11', 'sector' => 'Kilinochchi'],
            ['number' => '12', 'sector' => 'Mannar'],
            ['number' => '13', 'sector' => 'Vavuniya'],
            ['number' => '14', 'sector' => 'Mullaitivu'],
            ['number' => '15', 'sector' => 'Batticaloa'],
            ['number' => '16', 'sector' => 'Ampara'],
            ['number' => '17', 'sector' => 'Trincomalee'],
            ['number' => '18', 'sector' => 'Kurunegala'],
            ['number' => '19', 'sector' => 'Puttalam'],
            ['number' => '20', 'sector' => 'Anuradhapura'],
            ['number' => '21', 'sector' => 'Polonnaruwa'],
            ['number' => '22', 'sector' => 'Badulla'],
            ['number' => '23', 'sector' => 'Moneragala'],
            ['number' => '24', 'sector' => 'Ratnapura'],
            ['number' => '25', 'sector' => 'Kegalle']
        ];

        DB::table('districts')->insert($districts);
    }
}
