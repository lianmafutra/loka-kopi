<?php

namespace App\Http\Requests\Loka;

use App\Utils\DateUtils;
use Illuminate\Foundation\Http\FormRequest;

class GerobakRequest extends FormRequest
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
         'barista_id' => 'required',
     ];
   
     if (request()->isMethod('post')) {
       
     }
     return $rules;
   }
}
