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
    {
        return array_sum($this->Review->rate) / count($this->Reviews);
    }
    public function todayRestaurant()
    {
        return $this->hasMany(TodayRestaurant::class);
    }
    public function users()
    {
        return $this->hasMany(User::class);
    }
    public function tags(){
        return $this->belongsToMany(Tag::class)->withTimestamps()->withPivot('color');
    }
    

}