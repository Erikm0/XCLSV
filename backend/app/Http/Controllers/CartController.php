<?php

namespace App\Http\Controllers;

use App\Models\OrderItem;
use App\Models\Shipment;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Models\ShoppingCart;
use App\Models\Order;
use App\Models\Product;
use Illuminate\Support\Facades\DB;

class CartController extends Controller
{
    public function getCart()
    {
        $user = auth()->user();

        $order = Order::where('customer_id', $user->id)
            ->where('status_code_id', 1)
            ->first();

        if (!$order) {
            return response()->json([]);
        }

        $items = OrderItem::with('product')
        ->where('order_id', $order->id)
            ->get();


        return response()->json([
            'items' => $items,
            'total_price' => $order->total_price,
        ]);
    }


    public function addToCart(Request $request)
    {
        $user = auth()->user();

        // 1. Kosár létrehozása, ha még nincs
        ShoppingCart::firstOrCreate(['customer_id' => $user->id]);

        // 2. Aktív rendelés lekérése vagy létrehozása
        $order = Order::firstOrCreate(
            ['customer_id' => $user->id, 'status_code_id' => 1],
            ['total_price' => 0, 'order_date' => now()]
        );

        // 3. Termék lekérése az ár miatt
        $product = Product::findOrFail($request->product_id);
        $price = $product->price;

        // 4. OrderItem létrehozása vagy frissítése
        $orderItem = OrderItem::where('order_id', $order->id)
            ->where('product_id', $request->product_id)
            ->first();

        if ($orderItem) {
            // Már benne van a kosárban, frissítjük a mennyiséget
            $orderItem->quantity += $request->quantity;
            $orderItem->save();
        } else {
            // Új termék a kosárban
            OrderItem::create([
                'order_id' => $order->id,
                'product_id' => $request->product_id,
                'quantity' => $request->quantity,
                'price' => $price
            ]);
        }

        // 5. Total price frissítése az order táblában
        $total = OrderItem::where('order_id', $order->id)
            ->select(DB::raw('SUM(quantity * price) as total'))
            ->value('total');

        $order->total_price = $total;
        $order->save();

        return response()->json(['message' => 'Hozzáadva a kosárhoz.']);
    }

    public function createOrder()
    {
        $user = auth()->user();

        $order = Order::where('customer_id', $user->id)
            ->where('status_code_id', 1)
            ->first();

        if (!$order) {
            return response()->json(['error' => 'Nincs aktív rendelés!'], 400);
        }

        $orderItems = OrderItem::where('order_id', $order->id)->get();

        if ($orderItems->isEmpty()) {
            return response()->json(['error' => 'Üres a kosár!'], 400);
        }

        $order->status_code_id = 2;
        $order->order_date = now();
        $order->save();

        return response()->json(['message' => 'Rendelés véglegesítve', 'order_id' => $order->id]);
    }

    public function createShipment(Request $request)
    {
        $request->validate([
            'order_id' => 'required|exists:orders,id',
            'address' => 'required|string|max:255',
        ]);

        $shipment = Shipment::create([
            'order_id' => $request->order_id,
            'address' => $request->address,
            'shipped_at' => null
        ]);

        return response()->json(['message' => 'Szállítás létrehozva', 'shipment' => $shipment]);
    }

    public function removeFromCart(Request $request)
    {
        $user = auth()->user();
        $productId = $request->product_id;

        $order = Order::where('customer_id', $user->id)
            ->where('status_code_id', 1)
            ->first();

        if (!$order) {
            return response()->json(['error' => 'Nincs aktív kosár rendelés!'], 400);
        }

        OrderItem::where('order_id', $order->id)
            ->where('product_id', $productId)
            ->delete();

        $total = OrderItem::where('order_id', $order->id)
            ->select(DB::raw('SUM(quantity * price) as total'))
            ->value('total');

        $order->total_price = $total ?? 0;
        $order->save();

        return response()->json(['message' => 'Termék eltávolítva a kosárból.']);
    }
}
