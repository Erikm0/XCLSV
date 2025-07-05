<?php

namespace Database\Factories;

use App\Models\Order;
use App\Models\Customer;
use App\Models\OrderStatusCode;
use App\Models\ShoppingCart;
use Illuminate\Database\Eloquent\Factories\Factory;

class OrderFactory extends Factory
{
    protected $model = Order::class;

    public function definition(): array
    {
        return [
            'customer_id' => Customer::factory(),
            'status_code_id' => OrderStatusCode::factory(),
            'total_price' => $this->faker->randomFloat(2, 10, 500),
            'order_date' => $this->faker->dateTimeBetween('-1 year', now()),
        ];
    }
}
