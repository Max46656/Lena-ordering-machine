<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Restaurant extends Model
{
    use HasFactory;

    public function items()
    {
        return $this->hasMany(Item::class);
    }
    public function reviews()
    {
        return $this->hasMany(Review::class);
    }
    public function getRateAttribute()
    {$restaurantReviews = $this->reviews;
        $sum = 0;
        $num = 0;
        foreach ($restaurantReviews as $review) {
            # code...
            $num++;
            $sum += $review->rate;
        }
        return $sum / $num;
    }
}