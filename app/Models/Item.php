<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Models\User;

class Item extends Model
{
    use HasFactory;
    public function restaurant()
    {
        return $this->belongsTo(Restaurant::class);
    }
    public function users()
    {
        return $this->belongsToMany(User::class);
    }
    public function Order()
    {
        return $this->belongsTo(Order::class);
    }
}