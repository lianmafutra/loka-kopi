<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use App\Http\Requests\Loka\SliderRequest;
use App\Models\Slider;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SliderController extends Controller
{
   /**
    * Display a listing of the resource.
    */
   public function index()
   {
      $data = Slider::orderBy('order', 'ASC');
      if (request()->ajax()) {
         return datatables()->of($data)
            ->addIndexColumn()

            ->addColumn('foto', function ($data) {
               return ' <div class="shadow" style="width: 300px; height: 150px;">
                     <img src="' . $data?->foto_url . '" alt="Centered Image" class="img-fluid w-100 h-100" style="object-fit: cover;">
               </div>';
            })
            ->editColumn('isDetail', function ($data) {
               if ($data->isDetail == "true") {
                  return '<span class="badge badge-primary">Ya</span>';
               } else {
                  return '<span class="badge badge-secondary">Tidak</span>';
               }
            })
            ->editColumn('order', function ($data) {
               return $data->order;
            })
            ->addColumn('action', function ($data) {
               return view('app.master.slider.action', compact('data'));
            })
            ->rawColumns(['action', 'foto', 'isDetail'])
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
         $file->storeAs('public/uploads/slider/', $fileName);
        
         // Geser semua slider lainnya ke bawah (increment) karena slider baru akan di urutan 1
         Slider::where('order', '>=', 1)->increment('order');

         // Buat slider baru dengan order = 1
         $slider = new Slider();
       
      
         $slider = Slider::create(
            $requestSafe->merge(['foto' =>  $fileName, 'path' => 'uploads/slider/'])->except('new_order')
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

            $file->storeAs('public/uploads/slider/', $fileName);

            $slider->fill($request->safe()->merge(['foto' =>  $fileName, 'path' => 'uploads/slider/'])->except('new_order'))->save();
         } else {



            // Ambil slider yang ingin diubah
            $slider = Slider::find($slider->id);

            // Ambil order baru dari request
            $newOrder = $request->input('new_order');
            if($newOrder == 0){
               $newOrder = 1;
            }
            $currentOrder = $slider->order;
          
            if ($newOrder == $currentOrder) {
               // Jika order baru sama dengan yang lama, tidak perlu di-update
               return response()->json(['message' => 'Order tidak berubah.']);
            }

            // Update slider lainnya yang berada di antara order yang lama dan baru
            if ($newOrder < $currentOrder) {
               // Jika order baru lebih kecil, geser slider lainnya ke atas
               Slider::where('order', '>=', $newOrder)
                  ->where('order', '<', $currentOrder)
                  ->increment('order');
            } else {
               // Jika order baru lebih besar, geser slider lainnya ke bawah
               Slider::where('order', '>', $currentOrder)
                  ->where('order', '<=', $newOrder)
                  ->decrement('order');
            }

            // Update slider yang dipindahkan ke order yang baru
            $slider->order = $newOrder;
            $slider->fill($request->safe()->except('new_order'))->save();
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
