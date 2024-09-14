<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HistoriStok extends Model
{
   use HasFactory;
   protected $table = 'histori_stok';
   protected $guarded = [];
   protected $casts = [
     'created_at' => 'date:d-m-Y H:i:s',
     'updated_at' => 'date:d-m-Y H:i:s',
 ];
}
