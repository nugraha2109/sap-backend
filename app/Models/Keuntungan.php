<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Keuntungan extends Model
{
    protected $fillable = [
        'marketing_id',
        'bulan',
        'omzet',
        'persenan',
        'komisi',
        
    ];
}
