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


  
  public function getFotoUrlAttribute()
  {
      // Assuming 'foto' is the column that stores the file name of the image
      if ($this->foto) {
          return url('storage/uploads/' . $this->foto); // Change the folder path accordingly
      }

      return null; // Return null if no image is available
  }

  // Specify which attributes should be appended to the model's array and JSON form
  protected $appends = ['foto_url'];


}

