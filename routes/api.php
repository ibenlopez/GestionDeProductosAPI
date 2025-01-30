<?php

use App\Http\Controllers\UserController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ReviewController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::post('/register', [UserController::class,'register']);           //Ruta para el registro de usuarios
Route::post('/login', [AuthController::class, 'login']);                //Ruta para el login
Route::post('/refresh-token', [AuthController::class, 'refreshToken']); //Ruta para regenerar el access token

//Middleware que solicita un login para ejecutar las siguientes rutas:
Route::middleware('auth:sanctum')->group(function(){
    
    Route::post('/logout', [AuthController::class,'logout']);                   //Ruta para desloguear a un usuario que ha iniciado sesion
    Route::get('/validate-token', [AuthController::class, 'validateToken']);    //Ruta que genera la validacion del Token al usuario una vez logueado

    Route::get('/products', [ProductController::class,'list']);                 //Ruta que lista todos los productos existentes
    Route::post('/products', [ProductController::class,'store']);               //Ruta que permite almacenar productos
    Route::get('/products/{id}', [ProductController::class,'show']);            //Ruta que obtiene un producto bajo su ID
    Route::post('/products/{id}', [ProductController::class,'update']);          //Ruta para actualizar un producto
    Route::delete('/products/{id}', [ProductController::class,'destroy']);      //Ruta para eliminar un producto

    Route::get('/products/{id}/reviews', [ReviewController::class,'list']);     //Ruta para ver las reseñas de un producto
    Route::post('/products/{id}/review', [ReviewController::class,'store']);    //Ruta para crear una reseña en un producto
    Route::delete('/reviews/{id}', [ReviewController::class,'destroy']);        //Ruta para eliminar una reseña de un producto
});