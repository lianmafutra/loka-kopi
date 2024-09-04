<?php

namespace App\Http\Controllers;

use App\Http\Requests\UserRequest;
use App\Models\User;
use App\Utils\LmFileTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Spatie\Permission\Models\Role;

class UserController extends Controller
{
   use LmFileTrait;

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
         $user->nama_lengkap = $request->nama_lengkap;
         $user->kontak = $request->kontak;
         $user->email = $request->email;
         $user->jenis_kelamin = $request->jenis_kelamin;
         $user->alamat = $request->alamat;
         $user->save();
         DB::commit();

         return redirect()->back()->with('success', __('trans.crud.success'));
      } catch (\Throwable $th) {
         DB::rollback();

         return redirect()->back()->with('error', __('trans.crud.error'));
      }
   }

   public function changePhoto(UserRequest $request)
   {

      try {

         DB::beginTransaction();

         $data = User::find(auth()->user()->id);
         $data->fill($request->safe()->except('foto'))->save();

         $data
            ->addFile($request->foto)
            ->path('foto')
            ->field('foto')
            ->extension(['jpg', 'png','jpeg'])
            ->compress(40)
            ->withThumb(100)
            ->updateFile();

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
}
