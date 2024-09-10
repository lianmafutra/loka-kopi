<?php

namespace App\Providers;

use App\Models\SuratMasuk;
use App\Policies\SuratMasukPolicy;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;
use Laravel\Passport\Passport;
class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array<class-string, class-string>
     */
    protected $policies = [
        //   SuratMasuk::class => SuratMasukPolicy::class,
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();
      //   Passport::loadKeysFrom(__DIR__.'/../secrets/oauth');
     
        
        // Implicitly grant "Super-Admin" role all permission checks using can()
        Gate::before(function ($user, $ability) {
            return $user->hasRole('superadmin') ? true : null;
        });
    }
}
