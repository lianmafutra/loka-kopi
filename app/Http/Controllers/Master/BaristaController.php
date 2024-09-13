<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use App\Http\Requests\Loka\BaristaRequest;
use App\Models\Barista;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class BaristaController extends Controller
{
     /**
     * Display a listing of the resource.
     */
    public function index()
    {
      $data = Barista::with('user');
       if (request()->ajax()) {
          return datatables()->of($data)
             ->addIndexColumn()
             ->addColumn('foto', function ($data) {
               if (!empty($data->user?->foto) && trim($data->user?->foto) !== '') {
                  $foto =  url('storage/uploads/barista/' .$data->user?->foto);

                  return '<img class="foto img-circle elevation-3 foto p-0" src="'.$foto.'" height="40px" width="40px"; style="object-fit: cover; padding: 0px !important;">';
               }else{
                  return '<img onerror="this.onerror=null; this.src="'.asset('img/avatar.png').'" class="foto img-circle elevation-3 foto p-0" src="'.asset('img/avatar2.png').'" height="40px" width="40px"; style="object-fit: cover; padding: 0px !important;">';

               }
             
           })
             ->addColumn('action', function ($data) {
               return view('app.master.barista.action', compact('data'));
            })
             ->rawColumns(['action','foto'])
             ->make(true);
       }
       return view('app.master.barista.index', compact('data'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
   
      return view('app.master.barista.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(BaristaRequest $request)
    {
      try {

         DB::beginTransaction();
        $requestSafe = $request->safe();
       


        $file = $request->file('foto');
        $fileName =  preg_replace('/\s+/', '', Str::of(pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME)) . '_' . time() . '.' . $file->getClientOriginalExtension());

        $file->storeAs('public/uploads/barista/', $fileName);


         $user = User::create([
            'name' =>  $requestSafe->nama,
            'jenkel' =>  $requestSafe->jenkel,
            'kontak' =>  $requestSafe->kontak,
            'username' => $requestSafe->username,
            'password' => bcrypt($requestSafe->password),
            'foto' => $fileName,
            'path_foto' => 'storage/uploads/barista/',
         ]);

         $user->assignRole(User::ROLE_BARISTA);

         $barista = Barista::create(
            $requestSafe->merge([
               'users_id' => $user->id,
               ])->except('jenkel','nama','kontak','username','password','foto')
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
    public function show(Barista $barista)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Barista $barista)
    {
     $x['foto']  =  url('storage/uploads/barista/' .$barista->user?->foto);
      return view('app.master.barista.edit', compact('barista'), $x);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(BaristaRequest $request, Barista $barista)
    {
      try {
     
         DB::beginTransaction();
         $requestSafe = $request->safe();
         if ($request->hasFile('foto')) {


            $file = $request->file('foto');

            $fileName =  preg_replace('/\s+/', '', Str::of(pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME)) . '_' . time() . '.' . $file->getClientOriginalExtension());
           
            $file->storeAs('public/uploads/barista/', $fileName);

            // $produk->fill($request->safe()->merge(['foto' =>  $fileName])->all())->save();
            $user = User::find($barista->id)->update([
               'name' =>  $requestSafe->nama,
               'username' =>  $requestSafe->username,
               'jenkel' =>  $requestSafe->jenkel,
               'kontak' =>  $requestSafe->kontak,
               'foto' => $fileName,
               'path_foto' => 'storage/uploads/barista/',
            ]);

         } else {
            // $produk->fill($request->safe()->all())->save();

            $user = User::find($barista->id)->update([
               'name' =>  $requestSafe->nama,
               'username' =>  $requestSafe->username,
               'jenkel' =>  $requestSafe->jenkel,
               'kontak' =>  $requestSafe->kontak,
            ]);
         }
    
      

       

         $barista->fill($requestSafe->except('jenkel','nama','kontak','username','password','foto'))->save();
     
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
    public function destroy(Barista $barista)
    {
     
      try {
         DB::beginTransaction();
         
         $barista->delete();
         DB::commit();

         return $this->success(__('trans.crud.delete'));
      } catch (\Throwable $th) {
         DB::rollBack();

         return $this->error(__('trans.crud.error') . $th, 400);
      }
    }
}
