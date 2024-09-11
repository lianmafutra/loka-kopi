<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use App\Http\Requests\Loka\SliderRequest;
use App\Models\Slider;
use Illuminate\Container\Attributes\DB;

class SliderController extends Controller
{
   /**
    * Display a listing of the resource.
    */
   public function index()
   {
      $data = Slider::query();
      if (request()->ajax()) {
         return datatables()->of($data)
            ->addIndexColumn()
        
            ->addColumn('foto', function ($data) {
               return ' <div class="shadow" style="width: 90px; height: 100px;">
                     <img src="' . $data?->foto_url . '" alt="Centered Image" class="img-fluid w-100 h-100" style="object-fit: cover;">
               </div>';
            })
            ->addColumn('action', function ($data) {
               return view('app.master.slider.action', compact('data'));
            })
            ->rawColumns(['action', 'foto'])
            ->make(true);
      }
      return view('app.master.slider.index', compact('data'));
   }

   /**
    * Show the form for creating a new resource.
    */
   public function create()
   {

      return view('app.master.slider.create');
   }

   /**
    * Store a newly created resource in storage.
    */
   public function store(SliderRequest $request)
   {
      try {

         DB::beginTransaction();
         $requestSafe = $request->safe();




         $file = $request->file('foto');
         $fileName = Str::of(pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME)) . '_' . time() . '.' . $file->getClientOriginalExtension();

         $file->storeAs('public/uploads', $fileName);



         $slider = Slider::create(
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
   public function show(Slider $slider)
   {
      //
   }

   /**
    * Show the form for editing the specified resource.
    */
   public function edit(Slider $slider)
   {

      return view('app.master.slider.edit', compact('slider'));
   }

   /**
    * Update the specified resource in storage.
    */
   public function update(SliderRequest $request, Slider $slider)
   {
      try {



         DB::beginTransaction();

         if ($request->hasFile('foto')) {


            $file = $request->file('foto');

            $fileName = Str::of(pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME)) . '_' . time() . '.' . $file->getClientOriginalExtension();

            $file->storeAs('public/uploads', $fileName);

            $slider->fill($request->safe()->merge(['foto' =>  $fileName])->all())->save();
         } else {
            $slider->fill($request->safe()->all())->save();
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
   public function destroy(Slider $slider)
   {

      try {
         DB::beginTransaction();

         $slider->delete();
         DB::commit();

         return $this->success(__('trans.crud.delete'));
      } catch (\Throwable $th) {
         DB::rollBack();

         return $this->error(__('trans.crud.error') . $th, 400);
      }
   }
}
