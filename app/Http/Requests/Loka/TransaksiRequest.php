<?php

namespace App\Http\Requests\Loka;

use App\Utils\ApiResponse;
use App\Utils\DateUtils;
use Illuminate\Foundation\Http\FormRequest;

class TransaksiRequest extends FormRequest
{

   use ApiResponse;
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    protected function prepareForValidation(): void
    {
       $merges = [
       
         'user_id' => auth()->user()->id,
         'user_nama' => auth()->user()->name,
         'username' => auth()->user()->username,
         'tgl_transaksi' => DateUtils::format($this->tgl_transaksi),
       ];
       $this->merge($merges);
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
      $rules = [
         'produk_orders' => 'required',
         'user_id' => 'required',
         'user_nama' => 'required',
         'username' => 'required',
         'tgl_transaksi' => 'required|date_format:Y-m-d',
         'lokasi' => 'required',
     ];
     return $rules;
    }

     // Mengubah response jika validasi gagal
     protected function failedValidation(\Illuminate\Contracts\Validation\Validator $validator)
     {
         throw new \Illuminate\Validation\ValidationException($validator, $this->error($validator->errors()->first(), 422));
     }
}
