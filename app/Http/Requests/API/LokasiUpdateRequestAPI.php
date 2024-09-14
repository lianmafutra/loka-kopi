<?php

namespace App\Http\Requests\API;

use App\Utils\ApiResponse;
use Illuminate\Foundation\Http\FormRequest;

class LokasiUpdateRequestAPI extends FormRequest
{
   use ApiResponse;
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
       return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
         'lokasi_terkini' => 'required|string',
         'latitude' => 'required',
         'longitude' => 'required',
        ];
    }

      // Mengubah response jika validasi gagal
      protected function failedValidation(\Illuminate\Contracts\Validation\Validator $validator)
      {
          throw new \Illuminate\Validation\ValidationException($validator, $this->error($validator->errors()->first(), 422));
      }
}
