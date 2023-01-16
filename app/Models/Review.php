<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    use HasFactory;

    public function User()
    {
        return $this->belongsTo(User::class);
    }
    public function Restaurant()
    {
        return $this->belongsTo(Restaurant::class);
    }
    public function getReviewUserRestaurantAttribute()
    {
        return $this->User . $this->Restaurant;
    }
}
