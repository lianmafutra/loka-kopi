<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

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

 /**
  * Get the user that owns the Transaksi
  *
  * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
  */
 public function user(): BelongsTo
 {
     return $this->belongsTo(User::class, 'user_id', 'id');
 }


}
