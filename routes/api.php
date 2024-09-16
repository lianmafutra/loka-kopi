<?php

use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\BaristaController;
use App\Http\Controllers\API\ProdukController;
use App\Http\Controllers\API\SliderController;
use App\Http\Controllers\API\TransaksiController;
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

Route::get('slider/', [SliderController::class, 'list']);
Route::get('slider/detail/{slider_id}', [SliderController::class, 'detail'])->name('slider.detail');
Route::get('produk/list', [ProdukController::class, 'list']);
Route::get('produk/{id}', [ProdukController::class, 'detail']);


   

Route::middleware(['auth:api'])->group(function () {

   
 
   Route::post('user/logout', [AuthController::class, 'logout']);



   Route::get('user/detail', [AuthController::class, 'detail'])->name('user.detail');
   Route::post('user/updateFoto', [AuthController::class, 'updateFoto'])->name('user.updateFoto');;


   Route::post('barista/list/terdekat', [BaristaController::class, 'baristaTerdekat'])->name('barista.list.terdekat');
   Route::post('barista/{id}', [BaristaController::class, 'detail'])->name('barista.detail');

   Route::post('barista/lokasi/update', [BaristaController::class, 'lokasiUpdate'])->name('barista.lokasi.update');
   Route::post('barista/info/update', [BaristaController::class, 'updateInfoStatus'])->name('barista.info.update');

   Route::get('barista/lokasi/histori', [BaristaController::class, 'lokasiHistori'])->name('barista.lokasi.histori');
   
   Route::get('barista/produk/list', [BaristaController::class, 'baristaProduk'])->name('barista.produk');
   Route::get('transaksi/histori', [TransaksiController::class, 'transaksiHistori'])->name('barista.produk');
 
   Route::post('transaksi/input', [TransaksiController::class, 'store'])->name('transaksi.store');
 
   Route::post('transaksi/android/store', [TransaksiController::class, 'transaksiStore'])->name('android.transaksi.store');
   Route::get('transaksi/android/create', [TransaksiController::class, 'transaksiCreate'])->name('android.transaksi.create');


   Route::get('info', [TransaksiController::class, 'info'])->name('info');

 
});
