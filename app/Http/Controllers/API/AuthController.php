<?php

namespace App\Http\Controllers\API;


use App\Http\Controllers\Controller;
use App\Http\Requests\API\RegisterRequest;
use App\Models\TokenFCM;
use App\Models\User;
use App\Utils\ApiResponse;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class AuthController extends Controller
{

   use ApiResponse;

  

   public function login(Request $request)
   {


      if (Auth::attempt(['username' => $request->username, 'password' => $request->password])) {
         $user   = auth()->user();
         if ($user->status == "disable") {
            return response()->json(['success' => false, 'message' => 'User Diblokir, Silahkan Hubungi Admin'], 400);
         }
         $success['token'] = $user->createToken('sibanjir')->accessToken;
         $success['user']  = $user;
         return $this->success('User Berhasil Login', $success);
      } else {
         return $this->error('Username atau password salah', 400);
      }
   }



   public function register(RegisterRequest $request)
   {
    
      try {
         $input = $request->safe();
        
         $user = User::create($input->except(['email','password']));
         $token = $user->createToken('loka-api')->accessToken;

         return $this->success("Pendaftaran akun berhasil", ["user" => $user, "token" => $token]);
      } catch (Exception $th) {
         return $this->error("Pendaftaran User Gagal , " . $th->getMessage(), 400);
      }
   }



   public function logout(Request $request)
   {
      try {
         DB::beginTransaction();
         $auth = Auth::user()->token()->revoke();
         // TokenFCM::where('token', $request->token)->delete();
         DB::commit();
         return $this->success("Berhasil Logout");
      } catch (\Throwable $th) {
         DB::rollback();
         return $this->error($th->getmessage(), 400);
      }
   }
}
