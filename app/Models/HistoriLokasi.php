<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class HistoriLokasi extends Model
{
  
    use HasFactory;
    protected $table = 'histori_lokasi';
    protected $guarded = [];
    protected $casts = [
      'created_at' => 'datetime:d-m-Y H:i:s',
      'updated_at' => 'datetime:d-m-Y H:i:s',
  ];


  /**
   * Get the barista that owns the HistoriLokasi
   *
   * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
   */
  public function barista(): BelongsTo
  {
      return $this->belongsTo(Barista::class, 'barista_id', 'id');
  }
}
