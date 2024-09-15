<?php

namespace App\Http\Controllers\Loka;

use App\Http\Controllers\Controller;
use App\Models\Barista;
use App\Models\HistoriLokasi;
use Illuminate\Http\Request;

class InfoBaristaController extends Controller
{
    public function index(Request $request){

     $barista = Barista::with('user')
      ->join('users', 'barista.users_id', '=', 'users.id') // Assuming 'baristas' has a foreign key 'user_id'
      ->orderBy('users.created_at', 'desc') // Ordering by the related 'users' table's 'created_at'
      ->select('barista.*') // Ensure you're selecting from the 'baristas' table
      ->get();

      
       if (request()->ajax()) {

         $data = HistoriLokasi::with('barista');

         if ($request->has('select_barista') && $request->select_barista != null){
            $data->where('barista_id', $request->select_barista);
         }


          return datatables()->of($data)
             ->addIndexColumn()
             ->addColumn('foto', function ($data) {
               if (!empty($data->barista?->user?->foto) && trim($data?->barista?->user?->foto) !== '') {
                  $foto =  url('storage/uploads/barista/' .$data->barista?->user?->foto);

                  return '<img class="foto img-circle elevation-3 foto p-0" src="'.$foto.'" height="40px" width="40px"; style="object-fit: cover; padding: 0px !important;">';
               }else{
                  return '<img onerror="this.onerror=null; this.src="'.asset('img/avatar.png').'" class="foto img-circle elevation-3 foto p-0" src="'.asset('img/avatar2.png').'" height="40px" width="40px"; style="object-fit: cover; padding: 0px !important;">';

               }
             
           })
           ->addColumn('barista', function ($data) {
            return $data?->barista?->user?->name;
          
        })
             ->rawColumns(['foto'])
             ->make(true);
       }
       return view('app.barista.index', compact('barista'));
    }
}
