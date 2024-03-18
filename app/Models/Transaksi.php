<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transaksi extends Model
{
    protected $fillable = 
    [   'customer_id',
        'produk_id',
        'transaksi_kode',
        'nama_customer',
        'nama_produk',
        'jumlah'
    ];
    public function customer()
    {
        return $this->belongsTo(Customers::class);
    }

    public function produk()
    {
        return $this->belongsTo(Produk::class);
    }

}
