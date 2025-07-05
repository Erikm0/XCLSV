<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class OrderController extends Controller
{
    public function getOrders(){
        $orders = DB::table('orders')
        ->select(
            'orders.id',
            'products.product_image',
            'products.name',
            'order_items.quantity',
            'order_items.price',
            'order_status_codes.status_code',
            'orders.order_date'
        )
        ->join('order_status_codes', 'orders.status_code_id', '=', 'order_status_codes.id')
        ->join('order_items', 'orders.id', '=', 'order_items.order_id')
        ->join('products', 'order_items.product_id', '=', 'products.id')
        ->get();

    return response()->json($orders);
    }
}
