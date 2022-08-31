<?php

use App\Models\Product;
use Illuminate\Foundation\Testing\RefreshDatabase;
use function PHPUnit\Framework\assertSame;

// uses(RefreshDatabase::class);

it('has a path', function () {
    $product = Product::factory()->make();

    $this->assertEquals('/product/'.$product->id, $product->path());
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
