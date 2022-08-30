<?php

use App\Models\Product;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;

use function PHPUnit\Framework\assertInstanceOf;

uses(RefreshDatabase::class);

test('a guest can vist a product detail page', function () {
    $product = Product::factory()->create(['title' => 'my Title']);

    $response = $this->get(route('product.show', '1'));

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
            'title'         => 'My Title',
            'description'   => 'This is a description',
            'medium'        => 'Oil on Canvas',
            'size'          => "4' x 4'",
            'status'        => 'For Sale',
            'price'         => '12300',
            'discount'      => '0',
            'owner_id'      => User::factory()->create()->id,
            'likes'         => '10',
            'publish_at'    => '2010-05-03',
            'categories'    => '1,2,3'


        ])->assertSuccessful()->assertSee('My Title');

    $this->assertDatabaseHas('products', [
        'title' => 'My Title',
    ]);
    $this->assertDatabaseHas('category_product', [
        'Product_id' => '1',
        'category_id'=> '1,2,3'
    ]);
});


test('guests cannot view the edit a product page', function () {
    $product = Product::factory()->create();

    $response = $this->get('/product/1/edit');

    $response->assertRedirect('/login');
});

test('a logged in user can view the edit a product page', function () {
    $user = User::factory()->create();
    $product = Product::factory()->create();

    $response = $this->actingAs($user)->get('/product/1/edit');

    $response->assertSee($product->title)->assertSee('Update');
});

test('A logged in user can update a product', function () {

   // $this->withoutExceptionHandling();

    $user = User::factory()->create();
    $product = Product::factory()->create();


    $response = $this->actingAs($user)->put('/product/1', [
        'title'         => 'New Product',
        'description'   => 'This is a new description',
        'medium'        => 'Oil on Canvas',
        'size'          => "4' x 4'",
        'status'        => 'For Sale',
        'price'         => '12300',
        'discount'      => '0',
        'owner_id'      => '1',
        'likes'         => '10',
        'publish_at'    => '2010-05-03',
        'categories'    => [1,2,3]
    ]);

    $updatedProduct=Product::find(1);

   // $this->assertEquals('New Product', $updatedProduct->title);
    $this->assertDatabaseHas('category_product', [
        'product_id' => '1',
        'category_id'=> '2',
    ]);

});


test('A guest can select products by their status For Sale Not for Sale etc', function () {

    $product = Product::factory()->create(['status' => 'For Sale']);

    $response = $this->get('/status/For Sale')->assertSee('For Sale :');
});
