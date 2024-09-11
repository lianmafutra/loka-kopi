<?php

namespace App\Http\Requests\Loka;

use Illuminate\Foundation\Http\FormRequest;

class SliderRequest extends FormRequest
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
         'nama' => 'required',
         'foto' => 'required|file|mimes:jpg,jpeg,png|max:2000',
         'konten' => 'nullable',
         'isDetail' => 'required',
       
     ];

     if (request()->isMethod('put')) {
          $rules['foto'] =  'file|mimes:jpg,jpeg,png|max:2000|nullable';
     }

     return $rules;
   }
}
