<?php

namespace App\Http\Requests\API;

use Illuminate\Foundation\Http\FormRequest;

class RegisterRequest extends FormRequest
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
          'name' => $this->nama_lengkap,
          'username' => $this->email,
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
      return [
         'name'        => 'required|min:2|max:100|string',
         'username'               => 'required|string',
         'email'               => 'required|string',
         'kontak'              => 'required|string',
       
      ];
    }
}
