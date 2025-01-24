<?php

use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

//Rutas para registrar y loguear usuarios
Route::post('register', [UserController::class,'register']);
Route::post('login', [UserController::class,'login']);

//Rutas protegidas con token
Route::middleware('auth:sanctum')->group(function(){
Route::post('logout', [UserController::class,'logout']);


});