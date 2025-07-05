<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index()
    {
        $products = Product::all();
        return response()->json($products);
    }

    public function upload(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'category' => 'required|string|max:255',
            'description' => 'required|string',
            'size' => 'required|string|max:50',
            'price' => 'required|numeric',
            'stock' => 'required|boolean',
            'product_color' => 'nullable|string|max:50',
            'product_image' => 'nullable|string', // vagy ha file, akkor másként
        ]);

        $product = Product::create($validated);

        return response()->json([
            'message' => 'Sikeres feltöltés',
            'product' => $product,
        ]);
    }

    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'category' => 'required|string|max:255',
            'description' => 'required|string',
            'size' => 'required|string|max:50',
            'price' => 'required|numeric',
            'stock' => 'required|boolean',
            'product_color' => 'nullable|string|max:50',
            'product_image' => 'nullable|string',
        ]);

        $product = Product::findOrFail($id);
        $product->update($validated);

        return response()->json([
            'message' => 'Sikeres frissítés',
            'product' => $product,
        ]);
    }

    public function delete(Request $request, $id)
    {
        $product = Product::findOrFail($id);
        $product->delete();
        
        return response()->json([

            'message' => 'Sikeres törlése a '.$id.' azonosítójú '.$product->name.' terméknek '.$product->deleted_at.' időpontban',
        ]);
    }
}
