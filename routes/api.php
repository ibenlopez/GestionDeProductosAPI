<?php

use App\Http\Controllers\UserController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ReviewController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::post('/register', [UserController::class,'register']);

Route::post('/login', [AuthController::class, 'login']);

Route::post('/refresh-token', [AuthController::class, 'refreshToken']);

Route::middleware('auth:sanctum')->group(function(){
    
    Route::post('/logout', [AuthController::class,'logout']);

    Route::get('/validate-token', [AuthController::class, 'validateToken']);

    Route::get('/products', [ProductController::class,'list']);
    Route::post('/products', [ProductController::class,'store']);
    Route::get('/products/{id}', [ProductController::class,'show']);
    Route::put('/products/{id}', [ProductController::class,'update']);
    Route::delete('/products/{id}', [ProductController::class,'destroy']);

    Route::post('/products/{id}/review', [ReviewController::class,'store']);
    Route::delete('/reviews/{id}', [ReviewController::class,'destroy']);
});