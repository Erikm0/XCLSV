<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\ShipmentItem;

class ShipmentItemSeeder extends Seeder
{
    public function run(): void
    {
        ShipmentItem::factory(10)->create();
    }
}
