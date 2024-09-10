<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Produk;
use App\Utils\ApiResponse;
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
         $produk = Produk::findOrFail($produk_id);
         // Jika produk ditemukan, lakukan tindakan berikutnya
     } catch (ModelNotFoundException $e) {
         return $this->error("Produk tidak ditemukan", 404);
     }
    
    
      return $this->success("Detail Produk", $produk);
    }

}
