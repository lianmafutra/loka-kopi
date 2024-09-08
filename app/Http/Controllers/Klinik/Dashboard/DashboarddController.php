<?php

namespace App\Http\Controllers\klinik\Dashboard;

use App\Http\Controllers\Controller;
use App\Models\Barista;
use App\Models\Konsumen;
use App\Models\Pemeriksaan;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DashboarddController extends Controller
{
   public function index(Request $request)
   {


      $x['total_konsumen'] = Konsumen::count();
      $x['total_barista'] = Barista::count();
    


      return view('app.dashboard.index', $x);
   }
}
