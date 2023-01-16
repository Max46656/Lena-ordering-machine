<?php

namespace App\Models;

use App\Models\Item;
use App\Models\Review;
use App\Models\User;
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
    public function users()
    {
        return $this->belongsToMany(User::class);
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
        if ($num == 0) {
            $num = 1;
        }
        return $sum / $num;
    }
}