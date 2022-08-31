<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class UploadImageController extends Controller
{
    /**
     * Restricting certain functions to Auth Users only.
     */
    public function __construct()
    {
        $this->middleware('auth')->except('show');
    }

    public function load($product_id)
    {
        return view('images.upload', compact('product_id'));
    }

    public function upload(Request $request)
    {
        $this->validate($request, [
            'image' => 'required|mimes:jpeg,png,jpg,JPG|max:12000',
        ]);

        $product = Product::find($request->product_id);

        $product->addMediaFromRequest('image')
                ->toMediaCollection('photos', 's3');

        return redirect('/product/'.$request->product_id);
    }
}
