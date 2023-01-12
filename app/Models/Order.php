<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    public function Items()
    {
        return $this->belongsToMany(Item::class);
    }
    public function User()
    {
        return $this->belongsTo(User::class);
    }
    // public function getSubTotalAttribute()
    // {
    //     return $this->qty * $this->menu->price;
    // }

}