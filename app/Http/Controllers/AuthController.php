<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Exception;

class AuthController extends Controller
{
    //Metodo para el LOGIN
    public function login(Request $request)
    {
        //Validacion de campos "email" y "password"
        $credentials = $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        //Si los datos evaluados por "attempt()" desde la DB son incorrectos, se devuelve status 401 (Acceso invalido)
        if (!Auth::attempt($credentials)) {
            return response()->json(['message' => 'Accesos inválidos'], 401);
        }

        //Genera una regeneracion del Token de acceso cada despues de 5 min de haberse generado 
        $expires = now()->addMinutes(120);

        //Se obtiene al usuario que ha sido autenticado
        $user = Auth::user();      
        
        //Se genera el token de acceso para el usuario autenticado, donde el token tendra todos los permisos [*] y se pasa el tiempo de expiracion de 5 min
        $token = $user->createToken('auth_token', ['*'], $expires);
        
        //Se crea el refresh token usado para obtener un nuevo access token una vez expirado.
        $refreshToken = $user->createToken('refresh_token', ['refresh'], now()->addDays(7)); 

        //Respuesta de exito que devuelve el access token, refresh token y la fecha-hora en el que expira dicho token
        return response()->json([
            'access_token' => $token->plainTextToken,
            'refresh_token' => $refreshToken->plainTextToken,
            'expires' => $expires
        ], 200);
    }

    //Metodo para el Cierre de sesion de un usuario autenticado
    public function logout(Request $request)
    {

        try {
            $request->user()->tokens()->delete();   //Se eliminan todos los tokens del usuario autenticado

            return response()->json([               //Respuesta de exito ante esta eliminacion de tokens
                'message' => 'La sesión fué cerrada'
            ]);
        } catch (Exception $error) {        
            return response()->json([               //Respuesta de error obtenida en caso de alguna falla
                'error' => $error->getMessage()
            ], 400);
        }
    }

    //Metodo para generar el nuevo access token
    public function refreshToken(Request $request)
    {
        $request->validate(['refresh_token' => 'required']); 

        $user = Auth::guard('sanctum')->user();              //Se usa guard() de sanctum para obtener al usuario asociado al refresh token que ha sido proporcionado

        if (!$user) {                                        //Si no se encontro un usuario asociado, se devuelve status 401: Unauthorized
            return response()->json(['message' => 'Refresh token es inválido'], 401);
        }

        $expires = now()->addMinutes(120);                             //Se definen 120 minutos de expiracion a este nuevo access token

        $user->tokens()->where('tokenable_id', $user->id)->delete();   //Antes de crear un nuevo token, se eliminan todos los existentes asignado al usuario

        $newAccessToken = $user->createToken('auth_token', ['*'], $expires);                    //Despues se crea el nuevo access token con todos los permisos y expiracion de 120 min
        $newRefreshToken = $user->createToken('refresh_token', ['refresh'], now()->addDays(7)); //Y se genera el nuevo refresh token expirable en 7 dias

        //Respuesta de exito
        return response()->json([
            'access_token' => $newAccessToken->plainTextToken,
            'refresh_token' => $newRefreshToken->plainTextToken,
            'expires' => $expires
        ]);
    }

    //Metodo que verifica si el usuario logueado tiene un token valido
    public function validateToken()
    {
        //Guard() de sanctum para obtener al usuario y validar el token
        $user = Auth::guard('sanctum')->user();

        //Respuesta de exito si el token es verificado, devolviendo al usuario
        return response()->json(['message' => 'El token es válido', 'detail' =>  $user]);
    }
}
