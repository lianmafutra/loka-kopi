<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Produk extends Model
{
    use HasFactory;
    protected $table = 'produk';
    protected $guarded = [];
    protected $casts = [
      'created_at' => 'date:d-m-Y H:i:s',
      'updated_at' => 'date:d-m-Y H:i:s',
  ];
}
