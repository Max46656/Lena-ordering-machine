<?php

namespace App\Models;

use App\Models\ResturantMenu;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Restaurant extends Model
{
    public function restaurant_menus()
    {
        return $this->hasMany(RestaurantMenu::class);
    }
    use HasFactory;
}