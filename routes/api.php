<?php

use App\Http\Controllers\API\AuthController;
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
   Route::get('produk/list', [ProdukController::class, 'list']);
   Route::get('produk/{id}', [ProdukController::class, 'detail']);
});
