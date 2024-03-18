<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Marketingg;
use App\Models\Penjualann;
use Illuminate\Http\Request;
use DB;

class KomisiController extends Controller
{
    public function index()
    {
        $data = DB::table('marketinggs')
                    ->join('penjualanns', 'penjualanns.marketing_id', '=', 'marketinggs.id')
                    ->get();
       
        $marketingData = $data;
        // dd($data);
        
        $hasilKomisi = [];
        foreach ($marketingData as $marketing) {
            $namaMarketing = $marketing->nama;
            $penjualan = $marketing->total_semua;
            $date = $marketing->date;
            $komisi = $this->hitungKomisi($penjualan);
            
            $hasilKomisi[] = [
                'nama' => $namaMarketing,
                'penjualan' => $penjualan,
                'komisi' => $komisi,
                'Tanggal' => $date,
            ];
        }

        return response()->json($hasilKomisi, 200);
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
   public function omzet ()
   {
    $data = DB::table('marketinggs')
    ->join('keuntungans', 'keuntungans.marketing_id', '=', 'marketinggs.id')
    ->get();
    
    $marketingData = $data;
    $hasilKomisi = [];
    foreach ($marketingData as $marketing) {
        $namaMarketing = $marketing->nama;
        $penjualan = $marketing->omzet;
        $bulan = $marketing->bulan;
        $komisi = $this->Komisi($penjualan);
        
        $hasilKomisi[] = [
            'nama' => $namaMarketing,
            'penjualan' => $penjualan,
            'komisi nominal' => $komisi,
            'Tanggal' => $bulan,
        ];
    }

    return response()->json($hasilKomisi, 200);
   }
   private function Komisi($penjualan)
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
