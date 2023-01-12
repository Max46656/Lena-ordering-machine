<?php

namespace App\Models;

use App\Models\ResturantMenu;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Resturant extends Model
{
    public function resturant_menus()
    {
        return $this->hasMany(ResturantMenu::class);
    }
    use HasFactory;
}