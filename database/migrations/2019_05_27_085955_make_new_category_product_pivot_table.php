<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class MakeNewCategoryProductPivotTable extends Migration
{
    public function up()
    {
        Schema::create('category_product', function (Blueprint $table) {
            $table->integer('category_id')->unsigned();
            $table->integer('product_id')->unsigned();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('category_product', function (Blueprint $table) {
            Schema::dropIfExists('category_product');
        });
    }
}
