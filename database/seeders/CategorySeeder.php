<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('categories')->insert([
            'category' => 'Category 1',
        ]);

        DB::table('categories')->insert([
            'category' => 'Category 2',
        ]);

        DB::table('categories')->insert([
            'category' => 'Category 3',
        ]);
    }
}
