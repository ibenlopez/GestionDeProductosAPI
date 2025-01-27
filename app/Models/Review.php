<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use App\Models\Product;

class Review extends Model
{
    protected $table = 'reviews';

    protected $fillable = ['rating', 'comment', 'id_product'];

    protected $guarded = ['id'];

    public function product() {
        return $this->belongsTo(Product::class, 'id_product');
    }
}
