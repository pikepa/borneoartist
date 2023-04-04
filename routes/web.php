<?php

use App\Http\Livewire\User\Profile;
use App\Http\Controllers\UserController;
use App\Http\Livewire\Messages\ContactMe;
use App\Http\Livewire\Dashboard\Dashboard;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\UploadImageController;
use App\Http\Livewire\Messages\DisplayMessages;
use App\Http\Controllers\Images\ImageController;

/**
 * App Routes.
 */
Route::group(['middleware' => 'auth'], function () {
    Route::get('/dashboard', Dashboard::class)->name('dashboard');
    Route::get('/profile', Profile::class)->name('profile');
    Route::get('/message', DisplayMessages::class)->name('messages');
});

Route::get('/uploadtest', function () {
    return view('livewire.images.upload');
});

/* Home Routes web security */
Route::group(['middleware' => 'web'], function () {
    Route::get('/', [ProductController::class, 'index'])->name('root');
    Route::view('/theartist', 'homepages.theartist')->name('theartist');
    Route::view('/atwork', 'homepages.atwork')->name('atwork');
    Route::view('/materials', 'homepages.materials')->name('materials');
    Route::get('/contactme', ContactMe::class)->name('contactme');
    Route::view('/coming_soon', 'homepages.comingsoon')->name('comingsoon');
    Route::view('/loadimages', 'images.load')->name('loadimages');
});

Route::get('/status/{status}', [ProductController::class, 'status'])->name('productStatus');

Route::get('/bycategory/{id}', [CategoryController::class, 'bycategory'])->name('bycategory');

Route::resource('product', ProductController::class);
Route::resource('category', CategoryController::class);

Auth::routes();

Route::name('images.')->group(function () {
    Route::get('/images', [UploadImageController::class, 'index'])->name('index');
    Route::get('/images/{product}/load', [UploadImageController::class, 'load'])->name('load');
    Route::post('/images/upload', [UploadImageController::class, 'upload'])->name('upload');

    Route::get('/images/{product}/{image}/featured', [ImageController::class, 'make_featured'])->name('makefeatured');
    Route::get('/images/{image}', [ImageController::class, 'show'])->name('show');
    Route::get('/images/{image}/delete', [ImageController::class, 'destroy'])->name('destroy');
});

Route::group(['middleware' => 'auth'], function () {
    Route::get('/profile/{id}', [UserController::class, 'show'])->name('user.profile');
    Route::patch('/users/{id}', [UserController::class, 'update'])->name('user.update');
});
