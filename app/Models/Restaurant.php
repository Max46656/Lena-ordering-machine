<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Restaurant extends Model
{
    use HasFactory;

    public function Items()
    {
        return $this->hasMany(Item::class);
    }
    public function Reviews()
    {
        return $this->hasMany(Review::class);
    }
    public function getRateAttribute()
    {
        return array_sum($this->Review->rate) / count($this->Reviews);
    }
}