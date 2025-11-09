<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Tymon\JWTAuth\Facades\JWTAuth;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|unique:users',
            'password' => 'required|string|min:6',
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password)
        ]);

        $token = JWTAuth::fromUser($user);

        return response()->json([
            'status' => true,
            'message' => 'Register success',
            'user' => $user,
            'token' => $token
        ]);
    }

    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');

        if (!$token = Auth::guard('api')->attempt($credentials)) {
            return response()->json([
                'status' => false,
                'message' => 'Invalid email or password'
            ], 401);
        }

        return response()->json([
            'status' => true,
            'message' => 'Login success',
            'user' => Auth::user(),
            'token' => $token
        ]);
    }

    public function logout()
    {
        Auth::logout();

        return response()->json([
            'status' => true,
            'message' => 'Logout success'
        ]);
    }

    public function me()
    {
        return response()->json(Auth::user());
    }
}
