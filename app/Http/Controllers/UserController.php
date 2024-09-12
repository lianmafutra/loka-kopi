<?php

namespace App\Http\Controllers;

use App\Http\Requests\UserRequest;
use App\Models\User;
use App\Utils\ApiResponse;
use App\Utils\LmFileTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Str;

class UserController extends Controller
{
   use LmFileTrait;
   use ApiResponse;

   public function index()
   {
      $x['title'] = 'User';
      $x['data'] = User::get();
      $x['role'] = Role::get();

      return view('admin.user', $x);
   }

   public function profile()
   {
      $user = auth()->user();
      if ($user == null) {
         abort(404);
      }

    

      return view('admin.profile.index', compact('user'));
   }

   public function show($uuid)
   {

      $user = User::where('uuid', $uuid)->first();
      if ($user == null) {
         abort(404);
      }

      return view('app.user.profile', compact('user'));
   }

   public function update(Request $request)
   {
      try {
         $user = User::find(auth()->user()->id);
         $user->name = $request->name;
         $user->kontak = $request->kontak;
         // $user->email = $request->email;
         $user->jenkel = $request->jenkel;
        
         $user->save();
         DB::commit();

         return redirect()->back()->with('success', __('trans.crud.success'));
      } catch (\Throwable $th) {
         DB::rollback();
         dd($th);
         return redirect()->back()->with('error', __('trans.crud.error'));
      }
   }

   public function changePhoto(UserRequest $request)
   {

      try {

         DB::beginTransaction();

         $user = User::find(auth()->user()->id);
         // $data->fill($request->safe()->except('foto'))->save();

         if ($request->hasFile('foto')) {
           
           
            $file = $request->file('foto');
         
            $fileName = Str::of(pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME)) . '_' . time() . '.' . $file->getClientOriginalExtension();
         
            $file->storeAs('public/uploads/profile/', $fileName);

            $user->fill($request->safe()->merge(['foto' =>  $fileName,'path_foto' => 'uploads/profile/'])->all())->save();
            
         } else {
            $user->fill($request->safe()->all())->save();
         }



         DB::commit();

         return redirect()->back()->with('success', __('trans.crud.success'));
      } catch (\Throwable $th) {
         DB::rollback();

         return redirect()->back()->with('error', __('trans.crud.error') . $th->getMessage());
      }
   }

   public function store(Request $request)
   {
      $validator = Validator::make($request->all(), [
         'username' => ['required', 'string', 'max:255', 'unique:users'],
         'password' => ['required', 'string'],
         'role' => ['required'],
      ]);
      if ($validator->fails()) {
         return back()->withErrors($validator)
            ->withInput();
      }
      DB::beginTransaction();
      try {
         $user = User::create([
            'username' => $request->username,
            'password' => bcrypt($request->password),
         ]);
         $user->assignRole($request->role);
         DB::commit();
         Alert::success('Pemberitahuan', 'Data <b>' . $user->username . '</b> berhasil dibuat')->toToast()->toHtml();
      } catch (\Throwable $th) {
         DB::rollback();

         Alert::error('Pemberitahuan', 'Data <b>' . $request->username . '</b> gagal dibuat : ')->toToast()->toHtml();
      }

      return back();
   }

   public function destroy(Request $request)
   {
      try {
         $user = User::find($request->id);
         $user->delete();
         Alert::success('Pemberitahuan', 'Data <b>' . $user->name . '</b> berhasil dihapus')->toToast()->toHtml();
      } catch (\Throwable $th) {
         Alert::error('Pemberitahuan', 'Data <b>' . $user->name . '</b> gagal dihapus : ' . $th->getMessage())->toToast()->toHtml();
      }

      return back();
   }

   public function updateStatus(Request $request)
   {
      
      try {
         $user = User::find($request->user_id);
         
         if($user->status == "AKTIF"){
            $user->update([
               'status' => 'NONAKTIF'
            ]);
         }else{
            $user->update([
               'status' => 'AKTIF'
            ]);
         }
        
         return $this->success(__('trans.crud.success'));
      } catch (\Throwable $th) {
         DB::rollBack();
         return $this->error(__('trans.crud.error'), 400);
      }

     
   }

}
