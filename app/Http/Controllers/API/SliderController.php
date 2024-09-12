<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Slider;
use App\Utils\ApiResponse;
use Illuminate\Database\Eloquent\ModelNotFoundException;



class SliderController extends Controller
{
   use ApiResponse;
   public function list()
   {
     $slider = Slider::orderBy('order', 'ASC')->get();
     return $this->success("List Sliders", $slider);
   }


   public function detail($slider_id)
   {
        try {
              $slider = Slider::findOrFail($slider_id);
        } catch (ModelNotFoundException $e) {
              return $this->error("Data tidak ditemukan", 404);
        }
       
     return $this->success("Detail Slider", $slider);
   }
}
