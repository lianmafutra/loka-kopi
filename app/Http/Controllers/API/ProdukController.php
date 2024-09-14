<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Produk;
use App\Utils\ApiResponse;
use App\Utils\Rupiah;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\JsonResponse;

class ProdukController extends Controller
{
   use ApiResponse;
   public function list(): JsonResponse
   {
      $produk = Produk::get();
      return $this->success("List Produk", $produk);
   }


   public function detail($produk_id)
   {
      try {
         $produk = Produk::findOrFail($produk_id)->makeHidden(['stok', 'diskon']);
      } catch (ModelNotFoundException $e) {
         return $this->error("Produk tidak ditemukan", 404);
      }
      $produkTransform = [
         'id' =>  $produk?->id,
         'nama' =>  $produk?->nama,
         'foto' =>  $produk?->foto,
         'desc_short' =>  $produk?->desc_short,
         'harga' =>  $produk?->harga,
         'harga_format' =>  "Rp" . Rupiah::toRupiah($produk?->harga),
         'komposisi' =>  array_filter(array_map('trim', explode(';', $produk?->komposisi))),
         'promo' =>  $produk?->promo,
         'foto_url' => $produk?->foto_url,
      ];
      return $this->success("Detail Produk", $produkTransform);
   }
}
