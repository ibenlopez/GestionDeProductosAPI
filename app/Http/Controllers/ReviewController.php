<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Product;
use App\Models\Review;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class ReviewController extends Controller
{
    //Metodo que obtiene todas las reseñas de un producto especifico
    public function list(Request $request, $id_product){
        try {

            return response()->json([
                'message' => 'All reviews selected',
                'data' =>  Review::where('id_product', $id_product)->get(),
                    ], 200);
            
        } catch (Exception $error) {
            return response()->json([
                'error' => $error->getMessage()
            ], 400);
        }
    }

    //Metodo para crear reseñas en un producto
    public function store(Request $request, $id) {
        $validatedData = $request->validate([
            'rating' => 'required|numeric|min:1|max:5',
            'comment' => 'required|string',
        ]);

        $product = Product::findOrFail($id);

        $product->reviews()->create([
            'comment' => $validatedData['comment'],
            'rating' => $validatedData['rating'],
            'username' => $request->user()->name
        ]);

        return response()->json(['message' => 'Review created'], 201);
    }

    //Metodo para eliminar una reseña
    public function destroy($id) {
        $review = Review::findOrFail($id);

        $review->delete();

        return response()->json([
            'Message' => 'Review deleted successfully'
        ], 204);
    }

}