<?php

namespace App\Models;

use App\Models\Restaurant;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RestaurantMenu extends Model
{
    public function restaurant()
    {
        return $this->belongsTo(Restaurant::class);
    }
    use HasFactory;
}