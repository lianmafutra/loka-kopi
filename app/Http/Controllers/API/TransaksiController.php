<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\Loka\TransaksiRequest;
use App\Models\Produk;
use App\Models\Transaksi;
use App\Utils\ApiResponse;
use Exception;
use Illuminate\Support\Facades\DB;

class TransaksiController extends Controller
{

   use ApiResponse;

   public function info() {
      return $this->success("Nikmati Kesegaran tak tertandingi dari minuman es loka Kopi, Segarkan harimu !", 200);
   }

   public function store(TransaksiRequest $request)
   {
    
      if(auth()->user()->role != "barista"){
         return $this->error("Akses Tidak diizinkan", 401);
        }
      try {
         $array = json_decode($request->safe()->produk_orders, true);
         DB::beginTransaction();
         $requestSafe = $request->safe();

         foreach ($array as $key => $produk) {
            $produkData = Produk::find($produk['id']);
            Transaksi::create([
               'kode' => 1,
               'user_id' => $requestSafe->user_id,
               'user_nama' => $requestSafe->user_nama,
               'username' => $requestSafe->username,
               'jumlah' => $produk['jumlah'],
               'produk_id' => $produk['id'],
               'produk_nama' =>  $produkData->nama,
               'tgl_transaksi' => $requestSafe->tgl_transaksi,
               'lokasi' => $requestSafe->lokasi,
           ]);
         }

        
         DB::commit();
         return $this->success("Input Transaksi Berhasil");
      } 
     catch (Exception $th) {
         DB::rollBack();
         return $this->error("Input Transaksi Gagal , " . $th->getMessage(), 400);
      }
   }

   public function transaksiHistori()
   {
      if(auth()->user()->role != "barista"){
         return $this->error("Akses Tidak diizinkan", 401);
        }
      try {
         $transaksiHistori = Transaksi::where('user_id', auth()->user()->id)->get();
         return $this->success("Input Transaksi Berhasil", $transaksiHistori);
      } 
     catch (Exception $th) {
         return $this->error("Input Transaksi Gagal , " . $th->getMessage(), 400);
      }
   }
}
