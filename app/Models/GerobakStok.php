<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class GerobakStok extends Model
{
   use HasFactory;
   protected $table = 'gerobak_stok';
   protected $guarded = [];
   protected $casts = [
     'created_at' => 'datetime:d-m-Y H:i:s',
     'updated_at' => 'datetime:d-m-Y H:i:s',
 ];

 public function produk()
    {
        return $this->belongsTo(Produk::class, 'produk_id', 'id');
    }

    /**
     * Get the user that owns the GerobakStok
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function gerobak(): BelongsTo
    {
        return $this->belongsTo(Gerobak::class, 'gerobak_id', 'id');
    }

}
