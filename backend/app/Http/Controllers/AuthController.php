<?php

namespace App\Http\Controllers;

use App\Mail\FiokTorles;
use Illuminate\Http\Request;
use App\Models\Customer;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;
use Illuminate\Support\Carbon;
use App\Mail\JelszoMegadas;
use Illuminate\Validation\Rule;

class AuthController extends Controller
{
    #regisztráció
    public function register(Request $request)
    {
        $validatedData = $request->validate([
            'firstName' => 'required|string|max:255',
            'lastName' => 'required|string|max:255',
            'email' => [
                'required',
                'string',
                'email',
                'max:255',
                Rule::unique('customers')->whereNull('deleted_at')
            ],
            'phone' => [
                'required',
                'string',
                'max:15',
                Rule::unique('customers')->whereNull('deleted_at')],
            'date_of_birth' => 'required|date',
            'newsletter' => 'nullable|boolean',
        ]);

        $verificationToken = Str::random(64);
        $temporaryJelszo = Str::random(8);

        $customer = Customer::create([
            'first_name' => $validatedData['firstName'],
            'last_name' => $validatedData['lastName'],
            'email' => $validatedData['email'],
            'phone' => $validatedData['phone'],
            'date_of_birth' => $validatedData['date_of_birth'],
            'newsletter' => $validatedData['newsletter'] ?? false,
            'password' => Hash::make($temporaryJelszo),
            'verification_token' => $verificationToken,
        ]);

        Mail::to($customer->email)->send(new JelszoMegadas($customer, $verificationToken));

        return response()->json([
            'message' => 'Regisztráció sikeres! Kérlek ellenőrizd az emailed a fiók aktiválásához.'
        ], 201);
    }

    #bejelentkezés
    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $customer = Customer::where('email', $request->email)->whereNull('deleted_at')->first();

        $user = null;
        $role = null;

        if ($customer && Hash::check($request->password, $customer->password)) {
            $user = $customer;
            $role = 'customer';
        }

        if (!$user) {
            return response()->json(['message' => 'Invalid credentials'], 401);
        }
        $user->role = $role;
        $token = $user->createToken('auth_token', [$role])->plainTextToken;

        return response()->json([
            'access_token' => $token,
            'user' => $user,
            'user_type' => $role,
        ]);
    }




    #jelszó megadása
    public function setPassword(Request $request)
    {
        try {
            $request->validate([
                'password' => 'required|min:6',
                'password_confirmation' => 'required|min:6',
                'token' => 'required',
            ]);

            $customer = Customer::where('verification_token', $request->token)->first();

            if (!$customer) {
                return response()->json(['success' => false, 'message' => 'Érvénytelen token!'], 404);
            }

            $customer->password = Hash::make($request->password);
            $customer->email_verified_at = Carbon::now();
            $customer->verification_token = null;
            $customer->save();

            return response()->json(['success' => true, 'message' => 'Jelszó sikeresen beállítva.']);

        } catch (\Exception $e) {
            Log::error('setPassword error: '.$e->getMessage());
            return response()->json(['success' => false, 'message' => 'Szerverhiba!'], 500);
        }
    }

    #profil szerkesztése
    public function updateProfile(Request $request)
    {
        $user = Auth::user();

        $data = $request->only(['first_name', 'last_name', 'email', 'phone']);

        $request->validate([
            'first_name' => 'nullable|string|max:255',
            'last_name' => 'nullable|string|max:255',
            'email' => 'nullable|email|max:255|unique:users,email,' . $user->id,
            'phone' => 'nullable|string|max:20',
        ]);

        foreach ($data as $key => $value) {
            if ($value !== null && $value !== '') {
                $user->$key = $value;
            }
        }

        $user->save();

        return response()->json([
            'message' => 'Profil sikeresen frissítve.',
            'user' => $user
        ]);
    }


    #Törlés email küldése
    public function deleteProfileConfirmation($id)
    {
        $customer = Customer::find($id);

        if (!$customer) {
            return response()->json(['message' => 'Felhasználó nem található.'], 404);
        }
        Mail::to($customer->email)->send(new FiokTorles($customer, $id));

        return response()->json(['message' => 'Fiók törléséhez való email elküldve!']);
    }

    #Elfogadott email utáni törlés
    public  function deleteProfile($id)
    {
        $customer = Customer::find($id);
        if (!$customer) {
            return response()->json(['message' => 'Felhasználó nem található.'], 404);
        }
        $customer->deleted_at = Carbon::now();;
        $customer->save();
        return response()->json(['message' => 'Fiók sikeresen törölve.']);
    }
}
