<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\TransaksiRequest;
use App\Models\Transaksi;
use App\Utils\ApiResponse;
use Exception;
use Illuminate\Support\Facades\DB;

class TransaksiController extends Controller
{

   use ApiResponse;

   public function store(TransaksiRequest $request)
   {
      try {
         DB::beginTransaction();
         $input = $request->safe();
         Transaksi::create($input->all());
         DB::commit();
         return $this->success("Input Transaksi Berhasil");
      } 
     catch (Exception $th) {
         DB::rollBack();
         return $this->error("Input Transaksi Gagal , " . $th->getMessage(), 400);
      }
   }
}
