<?php

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
        Schema::table('delivery_charges', function (Blueprint $table) {
            $table->string('category')->nullable(false);
            $table->string('sub_category')->nullable();
            $table->float('first_kg')->nullable(false);
            $table->float('other_kg')->nullable(false);
            $table->time('time')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('delivery_charges', function (Blueprint $table) {
            $table->dropColumn('category');
            $table->dropColumn('sub_category');
            $table->dropColumn('first_kg');
            $table->dropColumn('other_kg');
            $table->dropColumn('time');
        });
    }
};
