<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use App\Models\Konsumen;
use Illuminate\Http\Request;

class KonsumenController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
      $data = Konsumen::with('users');
   
      if (request()->ajax()) {
         return datatables()->of($data)
            ->addIndexColumn()
            ->addColumn('foto', function ($data) {
              return '<img class="foto img-circle elevation-3 foto p-0" src="'.asset('img/avatar.png').''.'" height="40px" width="40px"; style="object-fit: cover; padding: 0px !important;">';
          })
            ->addColumn('action', function ($data) {
              return view('app.master.konsumen.action', compact('data'));
           })
            ->rawColumns(['action','foto'])
            ->make(true);
      }
      return view('app.master.konsumen.index', compact('data'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Konsumen $konsumen)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Konsumen $konsumen)
    {
     
      return view('app.master.konsumen.edit', compact('konsumen'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Konsumen $konsumen)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Konsumen $konsumen)
    {
        //
    }
}
