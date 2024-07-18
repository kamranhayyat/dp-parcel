<?php

use App\Models\City;
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
        Schema::table('merchant_shops', function (Blueprint $table) {
            $table->foreignIdFor(City::class)->nullable()->constrained();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('merchant_shops', function (Blueprint $table) {
            $table->dropConstrainedForeignIdFor(City::class);
            $table->dropColumn('city_id');
        });
    }
};
