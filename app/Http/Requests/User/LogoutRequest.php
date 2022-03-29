<?php

namespace App\Http\Requests\User;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Symfony\Component\HttpKernel\Exception\UnprocessableEntityHttpException;

class LogoutRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'token' => 'required'
        ];
    }

     /**
     * Throws an exception that shows the error messages
     *
     * @return exception
     */
    protected function failedValidation(Validator $validator)
    {
        throw new UnprocessableEntityHttpException($validator->errors()->toJson());
    }

    protected function failedAuthorization()
    {
        throw new HttpException(403);
    }
}

