<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreProductFormRequest;
use App\Models\Product;
use Carbon\Carbon;

class ProductController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth')->except('show', 'index', 'status');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $products = Product::orderBy('publish_at', 'desc')->Paginate(6);

        $cat = '';

        return view('homepages.home', compact('products', 'cat'));
    }

    /**
     * Display a listing of the products by status.
     *
     * @return \Illuminate\Http\Response
     */
    public function status($status)
    {
        $products = Product::OfStatus($status)->paginate(6);
        $cat = '';

        return view('homepages.home', compact('products', 'cat'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $assignedCats = [];

        return view('products.create', compact('assignedCats'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreProductFormRequest $request)
    {
        $request->publish_at = new Carbon($request->get('publish_at'));
        $product = auth()->user()->products()->create($request->except(['categories']));
        $product->categories()->sync($request->categories);

        return redirect($product->path());
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $product = Product::findorFail($id);

        $images = $product->getMedia('photos');

        $foundcats = $product->categories;
        $assignedCats = $product->categories->pluck('id')->toArray();
        //     dd($assignedCats);
        return view('products.product_detail', compact('product', 'images', 'foundcats'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Product $product)
    {
        // $this->authorize('manage', $product);

        $product = Product::findorFail($product->id);
        $assignedCats = $product->categories->pluck('id')->toArray();

        return view('products.edit', compact('product', 'assignedCats'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(StoreProductFormRequest $request, Product $product)
    {
        $request->publish_at = new Carbon($request->get('publish_at'));
        $product->update($request->except(['categories']));
        $product->categories()->sync($request->categories);

        return redirect($product->path());
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product)
    {
        //   $this->authorize('manage', $product);

        $product->delete();

        return redirect('/');
    }
}
