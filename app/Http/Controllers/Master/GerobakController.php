<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use App\Http\Requests\Loka\GerobakRequest;
use App\Models\Barista;
use App\Models\Gerobak;
use App\Models\GerobakStok;
use App\Models\HistoriStok;
use App\Models\Produk;
use App\Utils\ApiResponse;
use App\Utils\Rupiah;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class GerobakController extends Controller
{

   use ApiResponse;
   /**
    * Display a listing of the resource.
    */
   public function index()
   {
      $data = Gerobak::with('barista', 'barista.user','gerobakStoks');
      if (request()->ajax()) {
         return datatables()->of($data)
            ->addIndexColumn()

            ->addColumn('action', function ($data) {
               return view('app.master.gerobak.action', compact('data'));
            })

            ->addColumn('barista', function ($data) {
               return $data?->barista?->user?->name;
            })
            ->addColumn('total_stok', function ($data) {
               return $data?->gerobakStoks?->sum('jumlah_stok');
            })
            ->rawColumns(['action', 'foto'])
            ->make(true);
      }
      return view('app.master.gerobak.index', compact('data'));
   }

   /**
    * Show the form for creating a new resource.
    */
   public function create()
   {
      $barista = Barista::with('user')->get();
      return view('app.master.gerobak.create', compact(['barista']));
   }

   /**
    * Store a newly created resource in storage.
    */
   public function store(GerobakRequest $request)
   {
      try {
         DB::beginTransaction();
         $requestSafe = $request->safe();
         $gerobak = Gerobak::create(
            $requestSafe->all()
         );
         DB::commit();
         return $this->success(__('trans.crud.success'));
      } catch (QueryException $e) {
         $errorCode = $e->errorInfo[1];
         if ($errorCode == 1062) {
            return $this->error("Nama Gerobak " . $request?->nama . " Sudah ada, ", 400);
         }
      } catch (\Throwable $th) {
         DB::rollBack();
         return $this->error(__('trans.crud.error') . $th, 400);
      }
   }

   /**
    * Display the specified resource.
    */
   public function show(Gerobak $gerobak)
   {
      //
   }

   public function produkGerobakDetail(Request $request){
      $gerobakId = $request->gerobak_id;
     
      
      $data = Produk::where('id', $request->produk_id)->with(['gerobakStoks.gerobak','gerobakStoks' => function ($query) use ($gerobakId) {
         $query->where('gerobak_id', $gerobakId);
      }])->first();

      if($data->gerobakStoks==null){
         DB::beginTransaction();

         GerobakStok::create([
            "gerobak_id" =>  $gerobakId,
            "produk_id" =>  $request->produk_id,
            "jumlah_stok" => 0,
         ]);
         DB::commit();

         $data = Produk::where('id', $request->produk_id)->with(['gerobakStoks.gerobak','gerobakStoks' => function ($query) use ($gerobakId) {
            $query->where('gerobak_id', $gerobakId);
         }])->first();

         return $this->success('Data Produk Gerobak detail', $data, 200);
        
      }else{

         return $this->success('Data Produk Gerobak detail', $data, 200);
      
      }
   
   
   }


   public function updateStokGerobak(Request $request){


      try {
         DB::beginTransaction();

      
         $GerobakStok = GerobakStok::where('id', $request->gerobak_stok_id)->first();
         $stokTerbaru = $GerobakStok?->jumlah_stok + $request->stok_update;
   
        
   
       $GerobakStok->update([
            'jumlah_stok' => $stokTerbaru
         ]);
   
         // insert ke histori stok 
   
        $produk = Produk::find( $GerobakStok->produk_id);
          $gerobak =  Gerobak::find( $GerobakStok->gerobak_id);
          $barista =  Barista::find( $gerobak->id);
   
        $historiStok = HistoriStok::create([
            'user_id' => auth()->user()?->id,  
            'user_nama' => auth()?->user()?->name,  
            'gerobak_id' => $GerobakStok->gerobak_id,  
            'gerobak_nama' =>  $gerobak->nama,  
            'barista_nama' => $barista->user?->name,  
            'produk_id' => $produk->id,  
            'produk_nama' => $produk->nama,  
            'jumlah' => $request->stok_update,  
            'stok_sebelum' => $GerobakStok?->jumlah_stok,  
            'catatan' => $request->update_stok_ket,  
        ]);
         DB::commit();

         return $this->success('update data stok gerobak berhasil', 200);
      } catch (\Throwable $th) {
         DB::rollBack();
         return $this->error(__('trans.crud.error') . $th, 400);
      }

   



     
   }

   public function edit(Gerobak $gerobak)
   {


      $barista = Barista::with('user')->get();

      $gerobakId = $gerobak->id;

      $data = Produk::with(['gerobakStoks' => function ($query) use ($gerobakId) {
         $query->where('gerobak_id', $gerobakId);
      }]);


      if (request()->ajax()) {
         return datatables()->of($data)
            ->addIndexColumn()
            ->addColumn('harga_format', function ($data) {
               return   "Rp. " . Rupiah::toRupiah($data->harga);
            })
            ->addColumn('foto', function ($data) {
               return ' <div class="shadow" style="width: 50px; height: 50px">
               <img src="' . $data?->foto_url . '" alt="Centered Image" class="img-fluid w-100 h-100" style="object-fit: cover;">
                  </div>';
            })
            ->addColumn('stok', function ($data) {
               if ($data?->gerobakStoks) {
                  return $data?->gerobakStoks?->jumlah_stok;
               } else {
                  return 0;
               }
            })
            ->addColumn('action', function ($data) {
               return view('app.master.gerobak.action-stok', compact('data'));
            })

            ->rawColumns(['action', 'foto'])
            ->make(true);
      }

      return view('app.master.gerobak.edit', compact('gerobak', 'barista'));
   }

   /**
    * Update the specified resource in storage.
    */
   public function update(GerobakRequest $request, Gerobak $gerobak)
   {
      try {



         DB::beginTransaction();

         $gerobak->fill($request->safe()->all())->save();

         DB::commit();

         return $this->success(__('trans.crud.update'));
      } catch (\Throwable $th) {
         DB::rollBack();
         return $this->error(__('trans.crud.error') . $th, 400);
      }
   }

   /**
    * Remove the specified resource from storage.
    */
   public function destroy(Gerobak $gerobak)
   {

      try {
         DB::beginTransaction();

         $gerobak->delete();
         DB::commit();

         return $this->success(__('trans.crud.delete'));
      } catch (\Throwable $th) {
         DB::rollBack();

         return $this->error(__('trans.crud.error') . $th, 400);
      }
   }
}
