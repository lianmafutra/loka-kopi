<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transaksi extends Model
{
   use HasFactory;
   protected $table = 'transaksi';
   protected $guarded = [];
   protected $casts = [
     'created_at' => 'date:d-m-Y H:i:s',
     'updated_at' => 'date:d-m-Y H:i:s',
     'tgl_transaksi' => 'date:d-m-Y',
 ];


}
