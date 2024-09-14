<?php

namespace App\Http\Controllers\klinik\Dashboard;

use App\Http\Controllers\Controller;
use App\Models\Barista;
use App\Models\Konsumen;
use App\Models\Pemeriksaan;
use App\Models\Transaksi;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DashboarddController extends Controller
{
   public function index(Request $request)
   {


      $x['total_konsumen'] = Konsumen::count();
      $x['total_barista'] = Barista::count();
     
      $x['transaksi_hari_ini'] = Transaksi::whereDate('created_at', today())->count();
      $x['transaksi_bulan_ini'] = Transaksi::whereMonth('created_at', now()->month)->count();
      $x['transaksi_minggu_ini'] = Transaksi::whereBetween('created_at', [now()->startOfWeek(), now()->endOfWeek()])->count();
      $x['transaksi_tahun_ini'] = Transaksi::whereYear('created_at', now()->year)->count();
      $x['transaksi_seluruh'] = Transaksi::count();
      


      return view('app.dashboard.index', $x);
   }
}
