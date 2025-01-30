<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;

use Illuminate\Support\Facades\Storage;

class Product extends Model
{
    protected $table = 'products';

    protected $fillable = ['name', 'price', 'description', 'img'];

    protected $guarded = ['id'];

    protected $appends = ['img_url'];

    public function reviews() {
        return $this->hasMany(Review::class, 'id_product');
    }

    
    protected function casts(): array
    {
        return [
            'price' => 'double',
        ];
    }

    protected function imgUrl(): Attribute {
        return Attribute::make(
            get: fn (string | null $value, array $attributes) => $attributes["img"] == null || empty($attributes["img"]) ? null : asset(Storage::url($attributes["img"])),
        );
    }
}
