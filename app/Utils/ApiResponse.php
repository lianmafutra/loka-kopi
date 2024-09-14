<?php

namespace App\Utils;

trait ApiResponse
{
    protected function success($message = null, $data = null, $code = 200)
    {
      return response()->json([
         'success' => true,
         'message' => $message,
         'data' => $data ?? null, // Jika $data null, maka tidak akan dimasukkan
     ], $code);
    }

    protected function error($message, $code)
    {
      return response()->json([
         'success' => false,
         'message' => $message,
         'data' => $data ?? null, // Jika $data null, maka tidak akan dimasukkan
     ], $code);
    }
}
