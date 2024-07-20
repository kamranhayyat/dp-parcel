<?php

use App\Models\City;
use App\Models\District;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('parcels', function (Blueprint $table) {
            $table->foreignIdFor(District::class)->nullable()->constrained();
            $table->foreignIdFor(City::class)->nullable()->constrained();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('parcels', function (Blueprint $table) {
            $table->dropConstrainedForeignIdFor(District::class);
            $table->dropColumn('district_id');

            $table->dropConstrainedForeignIdFor(City::class);
            $table->dropColumn('city_id');
        });
    }
};
