<?php

namespace App\Exceptions;



use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class ResponseError
{
    /**
     * Return a formatted JSON error response.
     *
     * @param string $message
     * @param int $code
     * @param array|null $data
     * @return JsonResponse
     */
    public static function send(Request $request, string $message, int $code, array $data = null): JsonResponse
    {

      if ($request->is('api/*')) {
         return response()->json([
            'success' => false,
            'message' => $message,
        
            'code' => $code,
        ], $code);
   
           // Add additional data if provided
           if ($data) {
               $response['data'] = $data;
           }
   
           return response()->json($response, $code);
       }
       if ($request->ajax()) {

         return response()->json([
            'success' => false,
            'error' => $message,
            'code' => $code,
        ], $code);
   
           // Add additional data if provided
           if ($data) {
               $response['data'] = $data;
           }
   
           return response()->json($response, $code);
   
       
     }

       

      }
     
}
