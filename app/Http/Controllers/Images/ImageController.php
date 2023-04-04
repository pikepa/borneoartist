<?php

namespace App\Http\Controllers\Images;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class ImageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //  May use this later
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($image_id)
    {
        $image = Media::find($image_id);

        return view('images.show', compact('image'));
    }

    /**
     * Make an Image the featured image for a Product.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function make_featured($prod_id, $image_id)
    {
        $product = Product::find($prod_id);

        $product->update(['featured_img' => $image_id]);

        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($image_id)
    {
        $mediaitem = Media::find($image_id)->delete();

        return redirect()->back();
    }
}
