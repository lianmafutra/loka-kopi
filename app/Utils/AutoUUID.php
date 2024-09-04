<?php

namespace App\Utils;

use Illuminate\Support\Str;

trait AutoUUID
{
    protected static function boot()
    {
      parent::boot();
      static::creating(function ($model) {
          $model->uuid = (string) Str::uuid();
      });
    }
}
