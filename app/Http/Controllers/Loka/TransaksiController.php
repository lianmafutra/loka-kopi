<?php
namespace App\Http\Controllers\Loka;
use App\Http\Controllers\Controller;
use App\Models\Produk;
use App\Models\Transaksi;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class TransaksiController extends Controller
{
   public function index(Request $request)
   {
   
      $produk = Produk::query();
      if (request()->ajax()) {
         $waktu = Carbon::today()->format('Y-m-d');
         if ($request->rentang_waktu == "hari_ini") {
            $waktu = Carbon::today()->format('Y-m-d');
            $data = Transaksi::where('tgl_transaksi',  $waktu);
         } else if ($request->rentang_waktu == "minggu_ini") {
            $waktu = Carbon::now()->subDays(7)->format('Y-m-d');
            $data = Transaksi::where('tgl_transaksi', '>=', $waktu);
         } else if ($request->rentang_waktu == "bulan_ini") {
            $startOfMonth = Carbon::now()->startOfMonth()->format('Y-m-d');
            $endOfMonth = Carbon::now()->endOfMonth()->format('Y-m-d');
            $data = Transaksi::whereBetween('tgl_transaksi', [$startOfMonth, $endOfMonth]);
         } else {
            $data = Transaksi::query();
         }
         if($request->select_produk!=null){
            $data->where('id', $request->select_produk);
         }
         $data = Transaksi::with('user');
         return datatables()->of($data)
            ->addIndexColumn()
            ->addColumn('foto', function ($data) {
               return ' <div class="shadow" style="width: 90px; height: 100px;">
                        <img src="" alt="Centered Image" class="img-fluid w-100 h-100" style="object-fit: cover;"></div>';
            })
            ->addColumn('penginput', function ($data) {
               return $data?->user?->name;
            })
            ->addColumn('action', function ($data) {
               return view('app.transaksi.action', compact('data'));
            })
            ->addColumn('transaksi', function ($data) {
               return "";
            })
            ->rawColumns(['action', 'foto', 'komposisi2'])
            ->make(true);
      }
      return view('app.transaksi.index', compact('produk'));
   }
   public function create()
   {
      $x['products'] =Produk::get();
     return view('app.transaksi.create', $x);
   }
   public function store(Request $request)
   {
      try {
         DB::beginTransaction();
      foreach ($request->products as $product) {
         $produk = Produk::find($product['id']);
         Transaksi::create([
            'user_id' => auth()->user()->id,
            'user_nama' => auth()->user()->name, // menambahkan nama user
            'username' => auth()->user()->username, // menambahkan username user
            'produk_id' => $product['id'],
            'produk_nama' => $produk->nama, // asumsikan $produk adalah instance produk yang memiliki nama
            'jumlah' => $product['quantity'],
            'tgl_transaksi' => Carbon::now(), // menambahkan tanggal transaksi saat ini
            'lokasi' => '', // menambahkan lokasi transaksi, pastikan $lokasi didefinisikan
        ]);
     }
         DB::commit();
         return $this->success(__('trans.crud.success'));
      } catch (\Throwable $th) {
         DB::rollBack();
         return $this->error(__('trans.crud.error') . $th, 400);
      }
}

}
