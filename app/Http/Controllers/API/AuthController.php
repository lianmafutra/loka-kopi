<?php

namespace App\Http\Controllers\API;


use App\Http\Controllers\Controller;
use App\Http\Requests\API\RegisterRequest;
use App\Http\Requests\API\UserUpdateFotoRequestAPI;
use App\Http\Requests\API\UserUpdatePasswordRequest;
use App\Http\Requests\API\UserUpdateProfilRequest;
use App\Models\TokenFCM;
use App\Models\User;
use App\Utils\ApiResponse;
use Exception;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class AuthController extends Controller
{

   use ApiResponse;

   public function login(Request $request)
   {
      if (Auth::attempt(['username' => $request->username, 'password' => $request->password])) {
         $user   = auth()->user();
         if ($user->status == "NONAKTIF") {
            return response()->json(['success' => false, 'message' => 'User Diblokir, Silahkan Hubungi Admin'], 400);
         }
         $success['token'] = $user->createToken('loka-api')->accessToken;
         $success['user']  = $user;
         return $this->success('User Berhasil Login', $success);
      } else {
         return $this->error('Username atau password salah', 400);
      }
   }


   
   public function detail()
   {
      try {
         $data = auth()->user();
     } catch (ModelNotFoundException $e) {
         return $this->error("User tidak ditemukan", 404);
     }
      return $this->success("Info Detail User", $data);
   }



   public function register(RegisterRequest $request)
   {
      try {
         DB::beginTransaction();
         $input = $request->safe();

         $user = User::create($input->merge(['password' =>bcrypt('loka112277')])->except(['email']));
         $user->assignRole(User::ROLE_KONSUMEN);
         $token = $user->createToken('loka-api')->accessToken;
         DB::commit();
         return $this->success("Pendaftaran akun berhasil", ["user" => $user, "token" => $token]);
      } 
      catch (QueryException $e) {
         DB::rollBack();
         $errorCode = $e->errorInfo[1];
         if ($errorCode == 1062) {
            return $this->error("Email " . $request?->email . ", sudah terdaftar silahkan gunakan email lain", 400);
         }
      } catch (Exception $th) {
         DB::rollBack();
         return $this->error("Pendaftaran User Gagal , " . $th->getMessage(), 400);
      }
   }




   public function updateFoto(UserUpdateFotoRequestAPI $request)
   {
      try {
      
         DB::beginTransaction();
         if ($request->hasFile('foto')) {
         

            $file = $request->file('foto');

            $fileName =  preg_replace('/\s+/', '', Str::of(pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME)) . '_' . time() . '.' . $file->getClientOriginalExtension());
           
            $file->storeAs('public/uploads/profile/', $fileName);

            User::find(auth()->user()->id)->update([
               'foto' => $fileName,
               'path_foto' => 'storage/uploads/profile/',
            ]);
           
         }
         
         DB::commit();
         return $this->success("User Foto Profil Berhasil");
      } catch (\Throwable $th) {
         DB::rollback();
         return $this->error("User Foto Profil Gagal". $th->getMessage(), 400);
      }
   }
   
   public function  updateProfil(UserUpdateProfilRequest $request){
      try {
      
         DB::beginTransaction();
    
         $data = $request->safe()->all();
         User::where('id', auth()->user()->id)->update($data);

         DB::commit();
         return $this->success("Update User Data  Berhasil");
      } catch (\Throwable $th) {
         DB::rollback();
         return $this->error("Gagal Update Data User". $th->getMessage(), 400);
      }
   }
   public function updatePassword(UserUpdatePasswordRequest $request){
      try {
         
         if (!in_array(auth()->user()->role, ['barista', 'admin'])) {
            return $this->error("Akses Tidak diizinkan", 401);
        }
        
         DB::beginTransaction();

        

         $data = $request->safe()->all();
         User::where('id', auth()->user()->id)->update($data);

         DB::commit();
         return $this->success("Update password User Berhasil");
      } catch (\Throwable $th) {
         DB::rollback();
         return $this->error("Gagal Update Data User". $th->getMessage(), 400);
      }
   }



   public function logout(Request $request)
   {
      try {
         DB::beginTransaction();
         $auth = Auth::user()->token()->revoke();
         // TokenFCM::where('token', $request->token)->delete();
         DB::commit();
         return $this->success("User Berhasil Logout");
      } catch (\Throwable $th) {
         DB::rollback();
         return $this->error($th->getmessage(), 400);
      }
   }
}
