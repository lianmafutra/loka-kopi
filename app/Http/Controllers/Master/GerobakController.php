<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use App\Http\Requests\Loka\GerobakRequest;
use App\Models\Barista;
use App\Models\Gerobak;
use App\Utils\Rupiah;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\DB;

class GerobakController extends Controller
{
      /**
     * Display a listing of the resource.
     */
    public function index()
    {
      $data = Gerobak::with('barista','barista.user');
       if (request()->ajax()) {
          return datatables()->of($data)
             ->addIndexColumn()
           
             ->addColumn('action', function ($data) {
               return view('app.master.gerobak.action', compact('data'));
            })
           
            ->addColumn('barista', function ($data) {
               return $data?->barista?->user?->name;
            })
             ->rawColumns(['action','foto'])
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
            return $this->error("Nama Gerobak ".$request?->nama." Sudah ada, ", 400);
         }
      } 
      catch (\Throwable $th) {
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

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Gerobak $gerobak)
    {
      $barista = Barista::with('user')->get();
      $gerobak =  $gerobak->with('barista')->first();
    
      return view('app.master.gerobak.edit', compact('gerobak','barista'));
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
