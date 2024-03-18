<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pembayaran extends Model
{
    protected $fillable = 
    [   'penjualan_id',
        'marketing_id',
        'jumlah',
        'tanggal_jatuh_tempo',
        'status'
    ];
    public function penjualan()
    {
        return $this->belongsTo(Penjualann::class);
    }
}
