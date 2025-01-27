<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table = 'products';

    protected $fillable = ['name', 'price', 'description', 'img'];

    protected $guarded = ['id'];

    public function reviews() {
        return $this->hasMany(Review::class, 'id_product');
    }

    
    protected function casts(): array
    {
        return [
            'price' => 'double',
        ];
    }
}
