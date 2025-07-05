<?php

use App\Http\Controllers\OrderController;
use App\Http\Controllers\ProductController;
use App\Models\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\PasswordController;
use App\Http\Controllers\CartController;

/*Fiókok*/
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::post('/set-password', [AuthController::class, 'setPassword']);
Route::post('/deleteConfirmation/{id}', [AuthController::class, 'deleteProfileConfirmation']);
Route::post('/delete/{id}', [AuthController::class, 'deleteProfile']);


Route::middleware('deleted-e')->group(function () {
    Route::get('/customer', function (Request $request) {
    });
});
Route::get('/password-setup/{token}', [PasswordController::class, 'validateToken']);
Route::put('/updateProfile', [AuthController::class, 'updateProfile']);


/*Termékek*/
Route::post('/productsUpload', [ProductController::class, 'upload']);
Route::put('/productsUpdate/{id}', [ProductController::class, 'update']);
Route::get('/productsIndex', [ProductController::class, 'index']);
Route::post('/productsDelete', [ProductController::class, 'delete']);

/*kosár*/
Route::middleware('auth:sanctum')->group(function () {
    Route::post('/cart/add', [CartController::class, 'addToCart']);
    Route::post('/cart/remove', [CartController::class, 'removeFromCart']);
    Route::get('/cart', [CartController::class, 'getCart']);
    Route::post('/order', [CartController::class, 'createOrder']);
    Route::post('/shipment', [CartController::class, 'createShipment']);
    Route::post('/invoice/{orderId}', [CartController::class, 'createInvoice']);
});
Route::delete('/productsDelete/{id}', [ProductController::class, 'delete']);

// Adminok
Route::get('/adminsIndex', function () {
    $admins = Admin::all();
    return response()->json($admins);
});

Route::get('/ordersIndex', [OrderController::class, "getOrders"]);
