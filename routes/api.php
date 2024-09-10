<?php

use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\BaristaController;
use App\Http\Controllers\API\ProdukController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('user/login', [AuthController::class, 'login'])->name('login');
Route::post('user/register', [AuthController::class, 'register']);


Route::middleware(['auth:api'])->group(function () {

   Route::post('user/logout', [AuthController::class, 'logout']);

   Route::get('produk/list', [ProdukController::class, 'list']);
   Route::get('produk/{id}', [ProdukController::class, 'detail']);

   Route::get('user/detail', [AuthController::class, 'detail'])->name('user.detail');
   Route::post('barista/list/terdekat', [BaristaController::class, 'baristaTerdekat'])->name('barista.list.terdekat');
   Route::get('barista/{id}', [BaristaController::class, 'detail'])->name('barista.detail');
});
