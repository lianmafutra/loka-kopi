<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Produk;
use App\Utils\ApiResponse;
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
      $produk = Produk::find($produk_id);
      return $this->success("Detail Produk", $produk);
    }

}
