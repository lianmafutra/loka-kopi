<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Barista extends Model
{
    use HasFactory;
    protected $table = 'barista';
    protected $guarded = [];
    protected $casts = [
      'created_at' => 'datetime:d-m-Y H:i:s',
      'updated_at' => 'datetime:d-m-Y H:i:s',
      'tgl_lahir' => 'date:d-m-Y',
      'tgl_registrasi' => 'date:d-m-Y',
  ];

  


  /**
   * Get the user that owns the Barista
   *
   * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
   */
  public function user(): BelongsTo
  {
      return $this->belongsTo(User::class, 'users_id', 'id');
  }

  public function gerobak(): BelongsTo
  {
      return $this->belongsTo(Gerobak::class, 'gerobak_id', 'id');
  }

  public function setAttribute($key, $value)
  {
     if (in_array($key, ['foto', 'path_foto'])) {
        $this->attributes[$key] =preg_replace('/\s+/', '', $value);
        return $this;
     }
     return parent::setAttribute($key, $value);
  }


 
}
