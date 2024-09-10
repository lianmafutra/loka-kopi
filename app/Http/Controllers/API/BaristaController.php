<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Barista;
use App\Models\GerobakStok;
use App\Utils\ApiResponse;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class BaristaController extends Controller
{

   use ApiResponse;

   public function baristaTerdekat()
   {
      try {
         $data = Barista::with('gerobak','user')->get();
         $data->transform(function ($barista) {
            return [
               'barista_id' => $barista->id,
               'user_id' => $barista->user?->id,
               'nama' => strtoupper($barista->user?->name),
               'foto' => $barista?->user?->foto,
               'kontak' => $barista?->user?->kontak,
               'jarak' => '',
               'estimasi' => '',
               'lokasi_terkini' => '',
               'latitude' => '',
               'longitude' => '',
               'gerobak_id' => $barista->gerobak?->id,
               'gerobak_nama' => $barista->gerobak?->nama,
               'info' => ''
               // 'tgl_lahir' => $barista->tgl_lahir,
               // 'tgl_registrasi' => $barista->tgl_registrasi,
               // 'alamat' => $barista->alamat,
               // 'created_at' => $barista->created_at->format('d-m-Y H:i:s'),
               // 'updated_at' => $barista->updated_at->format('d-m-Y H:i:s'),
              
           ];
         });

         return response()->json($data);
      } catch (ModelNotFoundException $e) {
         return $this->error("barista tidak ditemukan", 404);
      }


      return $this->success("List Barista Terdekat", $data);
   }

   public function detail($barista_id)
   {
      try {
         $barista = Barista::where('id', $barista_id)->with('gerobak','user')->first();

         $stok = GerobakStok::with('produk')->where('gerobak_id', $barista->gerobak?->id)->get();
         $stok->transform(function ($stok) {
            return [
               'produk_id' => $stok->produk?->id,
               'nama' => $stok->produk?->nama,
               'foto' => $stok->produk?->foto,
               'stok' => $stok?->jumlah_stok,
           ];
         });
         $transformedData = [
            'barista_id' => $barista->id,
            'user_id' => $barista->user?->id,
            'nama' => strtoupper($barista->user?->name),
            'foto' => $barista?->user?->foto,
            'kontak' => $barista?->user?->kontak,
            'jarak' => '',
            'estimasi' => '',
            'lokasi_terkini' => '',
            'latitude' => '',
            'longitude' => '',
            'gerobak_id' => $barista->gerobak?->id,
            'gerobak_nama' => $barista->gerobak?->nama,
            'info' => '',
            'stok' => $stok
         ];
        

         return response()->json($transformedData);
      } catch (ModelNotFoundException $e) {
         return $this->error("barista tidak ditemukan", 404);
      }


      return $this->success("List Barista Terdekat", $data);
   }

}
