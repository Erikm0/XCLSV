<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Customer;

class PasswordController extends Controller
{
    public function validateToken($token)
    {
        $user = Customer::where('verification_token', $token)->first();

        if ($user) {
            return response()->json([
                'success' => true,
                'user' => $user
            ]);
        }

        return response()->json([
            'success' => false
        ]);
    }
}
