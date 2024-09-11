<?php

namespace App\Http\Requests\Loka;


use Illuminate\Foundation\Http\FormRequest;

class TransaksiRequest extends FormRequest
{
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
          'tgl_transasksi' =>"",
          
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
         'barista_id' => auth()->user()->id,
         'nama' => 'required',
         'tgl_lahir' => 'required|date_format:Y-m-d',
         'tgl_registrasi' => 'required|date_format:Y-m-d',
         'alamat' => 'required|string',
         'kontak' => 'required|string|max:50',
         'jenkel' => 'required|string',
     ];
   
    
     return $rules;
   }
}
