<?php

namespace App\Http\Controllers\Loka;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class TransaksiController extends Controller
{
    public function index(){
      return view('app.transaksi.index');
    }
}
