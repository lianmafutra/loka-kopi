<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class TinyEditorController extends Controller
{
   public function upload(Request $request)
   {
       $image = $request->file('file');
       $path = $image->store('uploads', 'public');

       return response()->json(['location' => asset("storage/{$path}")]);
   }
}
