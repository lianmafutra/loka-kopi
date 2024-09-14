<?php

namespace App\Http\Controllers\klinik\Dashboard;

use App\Http\Controllers\Controller;
use App\Models\Barista;
use App\Models\Gerobak;
use App\Models\Konsumen;
use App\Models\Produk;
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

      // Mendapatkan tanggal kemarin
      $kemarin = Carbon::yesterday()->toDateString();

      // Menghitung jumlah transaksi kemarin
      $x['transaksi_kemarin']= Transaksi::whereDate('created_at', $kemarin)->count();

   


      $x['gerobaks'] =  Gerobak::withCount('transaksi')
         ->with('barista') // Eager load barista
         ->orderBy('transaksi_count', 'desc')
         ->get();

         $x['produk'] =  Produk::withCount('transaksi')
        
         ->orderBy('transaksi_count', 'desc')
         ->get();

   

         



      return view('app.dashboard.index', $x);
   }


   public function grafikTransaksiPerbulan(){

        // Get the sum of 'jumlah' for each month in the 'transaksi' table
        $monthlyData = DB::table('transaksi')
            ->selectRaw('MONTH(tgl_transaksi) as month, SUM(jumlah) as total')
            ->groupBy(DB::raw('MONTH(tgl_transaksi)'))
            ->whereYear('tgl_transaksi', date('Y')) // Filter by the current year
            ->get();

        // Prepare an array to store the results for each month
        $monthlyResults = array_fill(1, 12, 0); // Initialize array with 12 months (January to December)

        foreach ($monthlyData as $data) {
            $monthlyResults[$data->month] = $data->total;
        }

        

        return response()->json($monthlyResults);
   }


   public function getDailyTransaksiData(Request $request)
   {
      $month = $request->query('month', Carbon::now()->month);
      $year = Carbon::now()->year;

      $dailyData = DB::table('transaksi')
          ->selectRaw('DAY(tgl_transaksi) as day, SUM(jumlah) as total')
          ->whereYear('tgl_transaksi', $year)
          ->whereMonth('tgl_transaksi', $month)
          ->groupBy(DB::raw('DAY(tgl_transaksi)'))
          ->orderBy(DB::raw('DAY(tgl_transaksi)'))
          ->pluck('total', 'day')
          ->toArray();

      // Fill missing days with zero
      $daysInMonth = Carbon::createFromFormat('Y-m-d', "$year-$month-01")->daysInMonth;
      $dailyData = array_replace(array_fill(1, $daysInMonth, 0), $dailyData);

      return response()->json($dailyData);
   }


 
}
