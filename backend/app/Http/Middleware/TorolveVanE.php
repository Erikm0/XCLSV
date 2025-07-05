<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Models\Customer;

class TorolveVanE
{
    public function handle(Request $request, Closure $next): Response
    {
        $customer = auth('customer')->user();

        if ($customer && $customer->deleted_at !== null) {
            return response()->json(['message' => 'A customer fiók törölve van.'], 403);
        }
        if ($customer && $customer->deleted_at == null) {
            $userData = $customer->toArray();
            $userData['role'] = 'customer';
            return response()->json($userData);
        }


        if (!$customer) {
            return response()->json(['message' => 'Nem hitelesített felhasználó.'], 401);
        }

        return $next($request);
    }
}
