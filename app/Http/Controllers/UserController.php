<?php

namespace App\Http\Controllers;

use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    
    //Registro de Usuario
    public function register(Request $request){

        try {
            $request->validate([
                'name' => 'required|string|max:255',
                'email' => 'required|string|max:255|unique:users',
                'password' => 'required|string|min:8'
            ]);

            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => Hash::make($request->password)
            ]);


            return response()->json([
                'message' => 'User created successfully',
                'data' => $user
                    ], 201);
                
            

            
        } catch (Exception $error) {
            return response()->json([
                'error' => $error->getMessage()
            ], 400);
        }
    }

    
 //Logueo de Usuario
 public function login(Request $request)
 {
     try {
         // Validación de las credenciales
         $request->validate([
             'email' => 'required|string|email',
             'password' => 'required|string|min:8'
         ]);
 
         // Extraer las credenciales del request
         $credentials = $request->only('email', 'password');
 
         // Intentar iniciar sesión
         if (!Auth::attempt($credentials)) {
             throw new Exception('Invalid credentials');
         }
 
         // Obtener el usuario autenticado
         $user = $request->user();
 
         // Crear el token con Sanctum
         $token = $user->createToken('auth_token')->plainTextToken;
 
         // Obtener la duración del token desde la configuración de Sanctum y convertimos a segundos
         $tokenExpiration = config('sanctum.expiration') * 60; 
 
         return response()->json([
             'message' => 'User logged successfully',
             'user' => $user,
             'token' => $token,
             'token_type' => 'Bearer',
             'expires_in' => $tokenExpiration, // Duración de la sesion en segundos
         ]);
     } catch (Exception $error) {
         return response()->json([
             'error' => $error->getMessage()
         ], 400);
     }
 }

    // Método para renovar el token
    public function refreshToken(Request $request)
    {
        $user = $request->user();

        // Elimina todos los tokens actuales del usuario
        $user->tokens()->delete();

        // Crea un nuevo token
        $newToken = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'access_token' => $newToken,
            'token_type' => 'Bearer',
            'expires_in' => config('sanctum.expiration') * 60 // Devuelve la expiración  de la sesion en segundos
        ]);
    }

    //Cierre de sesion del Usuario
    public function logout(Request $request){

        try {
           $request->user()->tokens()->delete();

           return response()->json([
            'message' => 'User logged out successfully'
           ]);
        }catch(Exception $error){
            return response()->json([
            'error' => $error->getMessage()
            ],400);
    };
}
}