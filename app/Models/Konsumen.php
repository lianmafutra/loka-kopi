<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Konsumen extends Model
{
    use HasFactory;
    protected $table = 'konsumen';
    protected $guarded = [];
    protected $casts = [
      'created_at' => 'datetime:d-m-Y H:i:s',
      'updated_at' => 'datetime:d-m-Y H:i:s',
  ];

   /**
   * Get the user that owns the Barista
   *
   * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
   */
  public function users(): BelongsTo
  {
      return $this->belongsTo(User::class, 'users_id', 'id');
  }


}
