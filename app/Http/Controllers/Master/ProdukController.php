<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use App\Http\Requests\Loka\ProdukRequest;
use App\Models\Produk;
use App\Utils\Rupiah;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;

class ProdukController extends Controller
{
   /**
    * Display a listing of the resource.
    */
   public function index()
   {
      $data = Produk::query();
      if (request()->ajax()) {
         return datatables()->of($data)
            ->addIndexColumn()
            ->addColumn('harga_format', function ($data) {
               return   "Rp. " . Rupiah::toRupiah($data->harga);
            })
            ->editColumn('komposisi2', function ($data) {
               // Ubah string menjadi array dengan delimiter ";"
               $items = explode(';', $data->komposisi);
               // Inisialisasi string untuk badge
               $badges = '';
               // Loop untuk setiap item dan buat badge
               foreach ($items as $item) {
                  $badges .= '<span class="badge badge-info">' . trim($item) . '</span> ';
               }
               return $badges;
            })

            ->addColumn('action', function ($data) {
               return view('app.master.produk.action', compact('data'));
            })
            ->rawColumns(['action', 'foto', 'komposisi2'])
            ->make(true);
      }
      return view('app.master.produk.index', compact('data'));
   }

   /**
    * Show the form for creating a new resource.
    */
   public function create()
   {

      return view('app.master.produk.create');
   }

   /**
    * Store a newly created resource in storage.
    */
   public function store(ProdukRequest $request)
   {
      try {

         DB::beginTransaction();
         $requestSafe = $request->safe();


       

         $file = $request->file('foto');
         $fileName = Str::of(pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME)) . '_' . time() . '.' . $file->getClientOriginalExtension();

         $file->storeAs('public/uploads', $fileName);

    
       
         $produk = Produk::create(
            $requestSafe->merge(['foto' =>  $fileName])->all()
         );


         DB::commit();
         return $this->success(__('trans.crud.success'));
      } catch (\Throwable $th) {
         DB::rollBack();
         return $this->error(__('trans.crud.error') . $th, 400);
      }
   }

   /**
    * Display the specified resource.
    */
   public function show(Produk $produk)
   {
      //
   }

   /**
    * Show the form for editing the specified resource.
    */
   public function edit(Produk $produk)
   {
 
      return view('app.master.produk.edit', compact('produk'));
   }

   /**
    * Update the specified resource in storage.
    */
   public function update(ProdukRequest $request, Produk $produk)
   {
      try {



         DB::beginTransaction();
       
         if ($request->hasFile('foto')) {
           
           
            $file = $request->file('foto');
         
            $fileName = Str::of(pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME)) . '_' . time() . '.' . $file->getClientOriginalExtension();
         
            $file->storeAs('public/uploads', $fileName);

            $produk->fill($request->safe()->merge(['foto' =>  $fileName])->all())->save();
            
         } else {
            $produk->fill($request->safe()->all())->save();
         }


        

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
   public function destroy(Produk $produk)
   {

      try {
         DB::beginTransaction();

         $produk->delete();
         DB::commit();

         return $this->success(__('trans.crud.delete'));
      } catch (\Throwable $th) {
         DB::rollBack();

         return $this->error(__('trans.crud.error') . $th, 400);
      }
   }
}
