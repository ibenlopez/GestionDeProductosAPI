<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $credentials = $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if (!Auth::attempt($credentials)) {
            return response()->json(['message' => 'Accesos inválidos'], 401);
        }

        $expires = now()->addMinutes(5);

        $user = Auth::user();
        $token = $user->createToken('auth_token', ['*'], $expires);
        $refreshToken = $user->createToken('refresh_token', ['refresh'], now()->addDays(7));

        return response()->json([
            'access_token' => $token->plainTextToken,
            'refresh_token' => $refreshToken->plainTextToken,
            'expires' => $expires
        ], 200);
    }

    public function logout(Request $request) {

        try {
           $request->user()->tokens()->delete();

           return response()->json([
            'message' => 'La sesión fué cerrada'
           ]);
        }catch(Exception $error){
            return response()->json([
            'error' => $error->getMessage()
            ],400);
        }
    }

    public function refreshToken(Request $request)
    {
        $request->validate(['refresh_token' => 'required']);

        $user = Auth::guard('sanctum')->user();

        if (!$user) {
            return response()->json(['message' => 'Refresh token es inválido'], 401);
        }

        $expires = now()->addMinutes(5);

        $user->tokens()->where('tokenable_id', $user->id)->delete();

        $newAccessToken = $user->createToken('auth_token', ['*'], $expires);
        $newRefreshToken = $user->createToken('refresh_token', ['refresh'], now()->addDays(7));

        return response()->json([
            'access_token' => $newAccessToken->plainTextToken,
            'refresh_token' => $newRefreshToken->plainTextToken,
            'expires' => $expires
        ]);
    }

    public function validateToken()
    {
        $user = Auth::guard('sanctum')->user();

        return response()->json(['message' => 'El token es válido', 'detail' =>  $user]);
    }
}
