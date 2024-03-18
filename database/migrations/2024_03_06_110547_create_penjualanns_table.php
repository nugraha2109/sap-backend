<?php

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
        Schema::create('penjualanns', function (Blueprint $table) {
            $table->id();
            $table->string('transaction_number');
            $table->integer('marketing_id');
            $table->integer('date');
            $table->integer('cargo_fee');
            $table->integer('total');
            $table->integer('total_semua');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('penjualanns');
    }
};
