<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class CheckApiUserStatus
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
      if (!auth()->user()->status == 'NONAKTIF') {
         return $this->error('Akun Anda telah dinonaktifkan karena melanggar ketentuan. Silakan hubungi Admin Loka Kopi untuk informasi lebih lanjut', 401);
      } else {
         return $next($request);
      }
    }
}
