<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Models\Customer;
use App\Models\Admin;

class CheckIfCustomerDeleted
{
    public function handle(Request $request, Closure $next): Response
    {
        $user = $request->user();

        if ($user instanceof Customer && $user->deleted_at !== null) {
            return response()->json(['message' => 'A fiók törölve lett.'], 403);
        }
        return $next($request);
    }
}
