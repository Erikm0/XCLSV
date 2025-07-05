<?php

namespace Database\Seeders;

use App\Models\OrderStatusCode;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class OrderStatusCodeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        OrderStatusCode::factory()->count(4)->create();
    }
}
