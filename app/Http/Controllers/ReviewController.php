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
    
    public function list(Request $request, $id_product){

        try {

            return response()->json([
                'message' => 'Test',
                'data' =>  Review::where('id_product', $id_product)->get(),
                    ], 201);
            
        } catch (Exception $error) {
            return response()->json([
                'error' => $error->getMessage()
            ], 400);
        }
    }

    public function store(Request $request, $id) {
        $validatedData = $request->validate([
            'rating' => 'required|numeric|min:1|max:5',
            'comment' => 'required|string',
        ]);

        $product = Product::findOrFail($id);

        $product->reviews()->create([
            'comment' => $validatedData['comment'],
            'rating' => $validatedData['rating'],
        ]);

        return response()->json(['message' => 'Review created'], 201);
    }

    public function destroy($id) {
        $review = Review::findOrFail($id);

        $review->delete();

        return response()->json([], 204);
    }

}