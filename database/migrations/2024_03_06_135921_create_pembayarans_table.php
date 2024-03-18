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
        Schema::create('pembayarans', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('penjualan_id');
            $table->unsignedBigInteger('marketing_id');
            $table->foreign('penjualan_id')->references('id')->on('penjualanns')->onDelete('cascade');
            $table->foreign('marketing_id')->references('id')->on('marketinggs')->onDelete('cascade');
            $table->integer('jumlah');
            $table->date('tanggal_jatuh_tempo');
            $table->enum('status', ['Belum Lunas', 'Lunas'])->default('Belum Lunas');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::drop('pembayarans');
        
    }
};
