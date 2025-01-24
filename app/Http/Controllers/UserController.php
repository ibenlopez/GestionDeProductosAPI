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
    public function login(Request $request){



        try {
            $request->validate([
                'email' => 'required|string|email',
                'password' => 'required|string|min:8'
            ]);
            //Extrahemos las credenciales del request
            $credentials = $request->only('email','password');

            if (!Auth::attempt($credentials)) {

               throw new Exception('Invalid credentials');
            }

            $user = $request->user();

            $token = $user->createToken('auth_token')->plainTextToken;

            return response()->json([
                'message' => 'User logged successfully',
                'user' => $user,
                'token' => $token,
                'token_type' => 'Bearer'
            ]);
                
            
        } catch (Exception $error) {
            return response()->json([
                'error' => $error->getMessage()
            ], 400);
        }
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