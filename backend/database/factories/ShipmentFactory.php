<?php

namespace Database\Factories;

use App\Models\Shipment;
use App\Models\Order;
use Illuminate\Database\Eloquent\Factories\Factory;

class ShipmentFactory extends Factory
{
    protected $model = Shipment::class;

    public function definition(): array
    {
        return [
            'order_id' => Order::factory(),
            'to_address' => $this->faker->address(),
            'sent_at' => $this->faker->dateTimeBetween('-1 week', 'now'),
            'arrived_at' => $this->faker->optional(0.8)->dateTimeBetween('now', '+1 week'),
        ];
    }
}
