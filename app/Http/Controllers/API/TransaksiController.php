<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\Loka\TransaksiRequest;
use App\Models\Produk;
use App\Models\Transaksi;
use App\Utils\ApiResponse;
use Exception;
use Illuminate\Support\Facades\DB;

use App\Models\Barista;
use App\Models\Gerobak;
use App\Models\GerobakStok;

use Carbon\Carbon;
use Illuminate\Http\Request;

class TransaksiController extends Controller
{

   use ApiResponse;

   public function info()
   {
      return $this->success("Info Beranda", "Nikmati Kesegaran tak tertandingi dari minuman es loka Kopi, Segarkan harimu !");
   }

   public function transaksiCreate()
   {
      $x['products'] = Produk::get();
      
      return view('app.transaksi.create', $x);
   }


   public function transaksiStore(Request $request)
   {
      try {
         sleep(1.5);
         DB::beginTransaction();
         foreach ($request->products as $product) {
            $produk = Produk::find($product['id']);
            $barista = Barista::with('gerobak')->find(auth()->user()->id);
            $gerobakstok = GerobakStok::where('gerobak_id', $barista->id)->where('produk_id', $product['id']);
            Transaksi::create([
               'user_id' => auth()->user()->id,
               'gerobak_id' => $barista->gerobak_id,
               'gerobak_nama' =>  $barista?->gerobak->nama,
               'user_nama' => auth()->user()->name, // menambahkan nama user
               'username' => auth()->user()->username, // menambahkan username user
               'produk_id' => $product['id'],
               'produk_nama' => $produk->nama, // asumsikan $produk adalah instance produk yang memiliki nama
               'jumlah' => $product['quantity'],
               'tgl_transaksi' => Carbon::now(), // menambahkan tanggal transaksi saat ini
               'lokasi' => '', // menambahkan lokasi transaksi, pastikan $lokasi didefinisikan
            ]);
            if ($gerobakstok->count() > 0) {
               $stokUpdate = $gerobakstok?->first()?->jumlah_stok -   $product['quantity'];
               $gerobakstok->update([
                  'jumlah_stok' => $stokUpdate
               ]);
            } else {
               return $this->error('Gerobak Id Tidak ditemukan', 400);
            }
         }
         DB::commit();
         return $this->success('Transaksi Stok Berhasil Di Update');
      } catch (\Throwable $th) {
         DB::rollBack();
         return $this->error(__('trans.crud.error') . $th, 400);
      }
   }
   public function store(TransaksiRequest $request)
   {

      if (auth()->user()->role != "barista") {
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
      } catch (Exception $th) {
         DB::rollBack();
         return $this->error("Input Transaksi Gagal , " . $th->getMessage(), 400);
      }
   }

   public function transaksiHistori()
   {

      try {
         if (auth()->user()->role != "barista") {
            return $this->error("Akses Tidak diizinkan", 401);
         }
         $transaksiHistori = Transaksi::where('user_id', auth()->user()->id)->orderBy('created_at', 'desc')->get();
         return $this->success("Input Transaksi Berhasil", $transaksiHistori);
      } catch (Exception $th) {
         return $this->error("Input Transaksi Gagal , " . $th->getMessage(), 400);
      }
   }
}
