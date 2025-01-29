<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Product;
use App\Models\Review;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class ProductController extends Controller
{
    
    //Mostrar los productos existentes
    public function list(){

        try {

            return response()->json([
                'message' => 'Test',
                'data' => Product::all(),
                    ], 201);
            
        } catch (Exception $error) {
            return response()->json([
                'error' => $error->getMessage()
            ], 400);
        }
    }

    //Mostrar un producto especifico
    public function show($id){

        $product = Product::find($id);

        $product->reviews = $product->reviews()->get();

        try {

            return response()->json([
                'message' => 'Test',
                'data' => $product,
                    ], 201);
            
        } catch (Exception $error) {
            return response()->json([
                'error' => $error->getMessage()
            ], 400);
        }
    }

    //Metodo que permite crear un nuevo producto
    public function store(Request $request) {
        $validatedData = $request->validate([
            'name' => 'required|string|max:250',
            'price' => 'required|numeric|min:0',
            'description' => 'nullable|string',
        ]);

        $product = Product::create($validatedData);

        return response()->json(['message' => 'Product created', 'product' => $product], 201);
    }

    //Metodo para actualizar informacion del producto especifico
    public function update(Request $request, $id) {
        $product = Product::findOrFail($id);

        $validatedData = $request->validate([
            'name' => 'sometimes|required|string|max:250',
            'price' => 'sometimes|required|numeric|min:0',
            'description' => 'nullable|string',
        ]);

        $product->update($validatedData);

        return response()->json(['message' => 'Product updated', 'product' => $product], 200);
    }

    //Metodo para eliminar a un producto especifico
    public function destroy($id) {
        $product = Product::findOrFail($id);

        $product->delete();

        return response()->json([
            'Message' => 'Product deleted Successfully'
        ], 204);
    }

}