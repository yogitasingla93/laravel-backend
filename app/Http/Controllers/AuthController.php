<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Laravel\Passport\HasApiTokens;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    // Register method
    public function register(Request $request)
    {
        // Validate the request
        $validator = Validator::make($request->all(), [
            'first_name' => 'required|string|max:255',
            'last_name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8|confirmed', // Ensure password confirmation
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        // Create a new user
        $user = User::create([
            'first_name' => $request->first_name,
            'last_name' => $request->last_name,
            'email' => $request->email,
            'password' => Hash::make($request->password), // Hash the password
        ]);

        // Create a token for the user
        $token = $user->createToken('yourappname')->accessToken;

        // Return the user and token in the response
        return response()->json(['user' => $user, 'token' => $token], 201);
    }

    // Existing login method
    public function login(Request $request)
    {
        // Validate the request
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        // Attempt to log the user in
        if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
            // Get the authenticated user
            $user = Auth::user();
            // Create a token for the user
            $token = $user->createToken('YourAppName')->accessToken;

            // Return the token in the response
            return response()->json(['token' => $token], 200);
        }
        

        // Return an unauthorized response if login fails
        return response()->json(['error' => 'Unauthorized'], 401);
    }

    public function logout(Request $request)
    {
        if (Auth::check()) {
            $request->user()->token()->revoke(); // Revoke the token
            return response()->json(['message' => 'Logged out successfully'], 200);
        }
        return response()->json(['error' => 'Unauthorized'], 401);
    }

}
