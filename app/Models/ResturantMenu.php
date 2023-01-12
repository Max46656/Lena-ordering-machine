<?php

namespace App\Models;

use App\Models\Resturant;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ResturantMenu extends Model
{
    public function resturant()
    {
        return $this->belongsTo(Resturant::class);
    }
    use HasFactory;
}