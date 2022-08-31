<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreProductFormRequest extends FormRequest
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
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'featured_img' => '',
            'title' => 'required|min:4|max:124',
            'description' => 'required|min:10|max:1500',
            'medium' => 'required',
            'size' => 'required',
            'status' => 'required|in:For Sale,Not For Sale,Sold,',
            'price' => 'required ',
            'discount' => 'required',
            'publish_at' => 'required|date',
            'categories' => '',
        ];
    }
}
