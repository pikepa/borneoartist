<?php

use App\Models\Product;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;

// uses(RefreshDatabase::class);

test('a guest can vist a product detail page', function () {
    $product = Product::factory()->create(['title' => 'my Title']);

    $response = $this->get(route('product.show', $product->id));

    $response->assertStatus(200)
             ->assertSee('my Title')
             ->assertSee('Categories');
});

test('guests cannot create a product', function () {
    $response = $this->get(route('product.create'));

    $response->assertRedirect('/login');

    $this->assertCount(0, Product::all());
});

test('logged in users can view the create product page', function () {
    $user = User::factory()->create();

    $response = $this->actingAs($user)->get(route('product.create'));

    $response->assertSuccessful();
    $response->assertSee('New Product')->assertSee('Save');
});

test('logged in users can create a product', function () {
    $user = User::factory()->create();

    $response = $this->actingAs($user)
        ->followingRedirects()
        ->post(route('product.store'), [
            'title' => 'My Title',
            'description' => 'This is a description',
            'medium' => 'Oil on Canvas',
            'size' => "4' x 4'",
            'status' => 'For Sale',
            'price' => '12300',
            'discount' => '0',
            'owner_id' => '99',
            'likes' => '10',
            'publish_at' => '2010-05-03',
            'categories' => [1,2,3],

        ])->assertSuccessful()->assertSee('My Title');

        $insertedProduct = Product::get()->last()   ;

    $this->assertDatabaseHas('products', [
        'title' => 'My Title',
        'status' => 'For Sale'
    ]);


    $this->assertDatabaseHas('category_product', [
        'product_id' => $insertedProduct->id,
        'category_id' => '3',
    ]);
});

test('guests cannot view the edit a product page', function () {
    $product = Product::factory()->create();

    $response = $this->get('/product/1/edit');

    $response->assertRedirect('/login');
});

test('a logged in user can view and edit a product page', function () {
    $user = User::factory()->create();
    $product = Product::factory()->create();
    
    $response = $this->actingAs($user)->get('/product/'.$product->id.'/edit');
    
    $response->assertStatus(200)
             ->assertSee($product->title)
             ->assertSee('My Product');
});

test('A logged in user can update a product', function () {
    // $this->withoutExceptionHandling();

    $user = User::factory()->create();
    $product = Product::factory()->create();

    $response = $this->actingAs($user)->put('/product/'.$product->id, [
        'title' => 'New Product Title',
        'description' => 'This is a new description',
        'medium' => 'Oil on Canvas',
        'size' => "4' x 4'",
        'status' => 'For Sale',
        'price' => '12300',
        'discount' => '0',
        'owner_id' => '1',
        'likes' => '10',
        'publish_at' => '2010-05-03',
        'categories' => [1, 2, 3],
    ]);

    $updatedProduct = Product::find($product->id);

    $this->assertEquals('New Product Title', $updatedProduct->title);

    $this->assertDatabaseHas('category_product', [
        'product_id' => $product->id,
        'category_id' => [1,2,3],
    ]);
});

test('A guest can select products by their status For Sale Not for Sale etc', function () {
    $product = Product::factory()->create(['status' => 'For Sale']);

    $response = $this->get('/status/For Sale')->assertSee('For Sale :');
});
