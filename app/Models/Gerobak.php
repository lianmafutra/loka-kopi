<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Gerobak extends Model
{
    use HasFactory;
    protected $table = 'gerobak';
    protected $guarded = [];
    protected $casts = [
      'created_at' => 'date:d-m-Y H:i:s',
      'updated_at' => 'date:d-m-Y H:i:s',
  ];


  /**
   * Get the user that owns the Gerobak
   *
   * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
   */
  public function barista(): BelongsTo
  {
      return $this->belongsTo(Barista::class, 'barista_id', 'id');
  }
  
  /**
   * Get all of the comments for the Gerobak
   *
   * @return \Illuminate\Database\Eloquent\Relations\HasMany
   */
  public function gerobakStoks(): HasMany
  {
      return $this->hasMany(GerobakStok::class, 'gerobak_id', 'id');
  }
  
}
