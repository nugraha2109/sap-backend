<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Marketingg extends Model
{
    protected $fillable = ['nama'];

    public function penjualan()
    {
        return $this->hasMany(Penjualann::class);
    }

    public function komisiPadaBulan($bulan)
    {
        // Ambil total penjualan pada bulan tertentu
        $totalPenjualan = $this->penjualan()
            ->whereMonth('date', $bulan)
            ->sum('jumlah');

        // Hitung komisi berdasarkan aturan
        $komisi = $this->hitungKomisi($totalPenjualan);

        return $komisi;
    }

    private function hitungKomisi($penjualan)
    {
        if ($penjualan <= 100000000) {
            return 0;
        } elseif ($penjualan <= 200000000) {
            return $penjualan * 0.025;
        } elseif ($penjualan <= 500000000) {
            return $penjualan * 0.05;
        } else {
            return $penjualan * 0.1;
        }
    }
}

