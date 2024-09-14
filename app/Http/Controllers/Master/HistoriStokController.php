<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use App\Models\HistoriStok;
use Illuminate\Http\Request;

class HistoriStokController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
      $data = HistoriStok::query();
      if (request()->ajax()) {
         return datatables()->of($data)
            ->addIndexColumn()
            ->rawColumns([])
            ->make(true);
      }
        return view('app.master.histori-stok.index');
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
    public function show(HistoriStok $historiStok)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(HistoriStok $historiStok)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, HistoriStok $historiStok)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(HistoriStok $historiStok)
    {
        //
    }
}
