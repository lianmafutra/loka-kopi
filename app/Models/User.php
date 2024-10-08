<?php

namespace App\Models;

use App\Utils\LmFileTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Hash;
use Laravel\Passport\HasApiTokens;


use Spatie\Permission\Traits\HasRoles;
use Spatie\ResponseCache\Facades\ResponseCache;
use Storage;

class User extends Authenticatable 
{
   
    use HasRoles;
    use LmFileTrait;
    use HasApiTokens, HasFactory, Notifiable;

    const ROLE_KONSUMEN = 'konsumen';
    const ROLE_BARISTA = 'barista';
    const ROLE_ADMIN = 'admin';
    const ROLE_SUPERADMIN = 'superadmin';
    
   //  use \OwenIt\Auditing\Auditable;
  
    protected $guarded = [];
    protected $table = 'users';
    protected $hidden = [
        'password',
        'remember_token',
        'roles'
    ];

   //  public function transformAudit(array $data): array
   //  {
   //      return (new CustomAudit())->initData($data);
   //  }

   protected function casts(): array
   {
       return [
         'created_at' => 'datetime:d-m-Y H:i:s',
         'password' => 'hashed',
         'updated_at' => 'datetime:d-m-Y H:i:s',
         'last_login_at' => 'date:d/m/Y H:i:s',
         'foto' => 'string',
       ];
   }

  

    protected $appends = [
        'role','foto_url'
    ];

    public function setAttribute($key, $value)
    {
       if (in_array($key, ['foto', 'path_foto'])) {
          $this->attributes[$key] =preg_replace('/\s+/', '', $value);
          return $this;
       }
       return parent::setAttribute($key, $value);
    }

    public function scopeFilter($query)
    {
        return $query->whereDate('created_at', \Carbon\Carbon::today());
    }

    public static function boot()
    {
        parent::boot();
        self::created(function () {
            ResponseCache::forget(route('master-user.index'));
        });

        self::updated(function () {
            ResponseCache::forget(route('master-user.index'));
        });

        self::deleted(function () {
            ResponseCache::forget(route('master-user.index'));
        });
    }

    public function getRoleName()
    {
        return implode(',', $this->getRoleNames()->toArray());
    }

    public function getRoleAttribute()
    {
        return implode(',', $this->getRoleNames()->toArray());
    }

    public function file_foto()
    {
        return $this->hasOne(File::class, 'file_id', 'foto')->withDefault();
    }

    public function checkPassword($password)
    {
        if (Hash::check($password, auth()->user()->password)) {
            return true;
        } else {
            return false;
        }
    }

    public function getUrlFoto()
    {

        $file = User::where('id', $this->attributes['id'])->with('file_foto')->whereHas('file_foto')->first()?->file_foto;
        if ($file) {
            return Storage::url($file->path.'/'.$file->name_random);
        } else {
            return asset('img/avatar2.png');
        }
    }

    public function getFotoUrlAttribute()
    {
        // Assuming 'foto' is the column that stores the file name of the image
        if ($this->foto) {
            return url('storage/uploads/profile/' . $this->foto); // Change the folder path accordingly
        }
   
        return url('img/placeholder_produk.png' . $this->foto);; // Return null if no image is available
    }
   
    // Specify which attributes should be appended to the model's array and JSON form
 


    public function barista(): HasOne
    {
        return $this->hasOne(Barista::class);
    }


    public function konsumen(): HasOne
    {
        return $this->hasOne(Konsumen::class);
    }

    
    public function pemeriksaan(): HasOne
    {
        return $this->hasOne(Pemeriksaan::class,'user_id','id');
    }
}
