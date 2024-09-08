<?php

use App\Http\Controllers\Admin\MasterUserController;
use App\Http\Controllers\Admin\SampleCrudController;
use App\Http\Controllers\Admin\TinyEditorController;
use App\Http\Controllers\BerandaController;
use App\Http\Controllers\Klinik\Dashboard\DashboarddController;
use App\Http\Controllers\Loka\TransaksiController;
use App\Http\Controllers\Master\BaristaController;
use App\Http\Controllers\Master\GerobakController;
use App\Http\Controllers\Master\KonsumenController;
use App\Http\Controllers\Master\LokasiController;
use App\Http\Controllers\Master\ProdukController;
use App\Http\Controllers\UserController;

use Illuminate\Support\Facades\Route;



Route::middleware(['auth'])->group(function () {
   Route::get('beranda', [BerandaController::class, 'index'])->name('beranda.index');

   Route::controller(UserController::class)->group(function () {
      Route::put('user/profile/{user_id}', 'update')->name('user.update');
      Route::get('user/profile', 'profile')->name('user.profile');
      Route::get('user/profile/{username}', 'show')->name('user.show');
      Route::put('user/profile/photo/change', 'changePhoto')->name('user.change.photo');
      Route::post('user/status/', 'updateStatus')->name('user.status');
   });

   Route::post('tiny-editor/upload', [TinyEditorController::class, 'upload'])->name('tiny-editor.upload');
   Route::resource('sample-crud', SampleCrudController::class);


   // app Klinik
   Route::get('dashboard', [DashboarddController::class, 'index'])->name('loka.dashboard.index');
 

   Route::resource('master/konsumen', KonsumenController::class, [
      'as' => 'master-data'
   ])->parameters(['konsumen' => 'konsumen']);
   
   Route::resource('master/barista', BaristaController::class, [
      'as' => 'master-data'
   ])->parameters(['barista' => 'barista']);
   
   Route::resource('master/gerobak', GerobakController::class, [
      'as' => 'master-data'
   ]);

   Route::get('produk/gerobak/detail', [GerobakController::class, 'produkGerobakDetail'])->name('produk.gerobak.detail');
   Route::put('produk/gerobak/updateStok', [GerobakController::class, 'updateStokGerobak'])->name('produk.gerobak.update.stok');
 
   
 
   Route::resource('master/lokasi', LokasiController::class, [
      'as' => 'master-data'
   ]);
   Route::resource('master/produk', ProdukController::class, [
      'as' => 'master-data'
   ]);




   Route::resource('master-data/pengguna', MasterUserController::class, [
      'as' => 'master-data'
   ]);



   Route::get('transaksi', [TransaksiController::class, 'index'])->name('transaksi.index');

 
});


