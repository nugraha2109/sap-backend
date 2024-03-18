<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Penjualann extends Model
{
    protected $fillable = [
        'transaction_number',
        'marketing_id',
        'date',
        'cargo_fee',
        'total',
        'total_semua',
    ];
    
}
