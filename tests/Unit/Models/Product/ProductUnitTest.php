<?php

use App\Models\Product;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use function PHPUnit\Framework\assertSame;

// uses(RefreshDatabase::class);

it('has a path', function () {
    $product = Product::factory()->make();

    $this->assertEquals('/product/'.$product->id, $product->path());
});

test('when the product title is changed the slug changes', function () {
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

    $this->assertEquals('new-product-title', $updatedProduct->slug);
});

test('a Product has an Owner', function () {
    $product = Product::factory()->create(['owner_id' => 99]);

    $this->assertEquals('99', $product->owner_id);
});

test('the published date is correctly formatted', function () {
    $product = Product::factory(['publish_at' => '2022-05-12'])->make();

    assertSame('May 12, 2022', $product->published_date);
});

test('the discounted price is calculated and formatted correctly', function () {
    $product = Product::factory([
        'price' => '10000',
        'discount' => '20', ])
        ->make();

    $this->assertEquals('80.00', $product->discounted_price);
});

test('the Retail price is calculated and formatted correctly', function () {
    $product = Product::factory([
        'price' => '10000', ])
        ->make();

    $this->assertEquals('100.00', $product->retail_price);
});

// test('Product Validation rules on save', function ($field, $value, $rule) {
//     Livewire::test(ManagePosts::class)
//     ->set($field, $value)
//     ->call('save')
//     ->assertHasErrors([$field => $rule]);
// })->with('post_validation')->skip();
