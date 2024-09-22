<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Lokasi extends Model
{
    use HasFactory;
    protected $table = 'lokasi';
    protected $guarded = [];
    protected $casts = [
      'created_at' => 'datetime:d-m-Y H:i:s',
      'updated_at' => 'datetime:d-m-Y H:i:s',
  ];
}
