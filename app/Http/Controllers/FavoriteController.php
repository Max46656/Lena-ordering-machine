<?php

namespace App\Http\Controllers;

use App\Models\RestaurantUser;
use App\Models\Review;
use App\Models\User;
use Illuminate\Http\Request;

class FavoriteController extends Controller
{
    public function addFavoriteRestaurant(Request $request)
    {
        $userId = User::select('id')->where('name', session('name'))->first();

        $favorite = new RestaurantUser;
        $favorite->restaurant_id = $request->favorite;
        $favorite->user_id = $userId['id'];
        $favorite->save();
        return redirect(url('/menu/' . $request->favorite));

    }
    public function deleteFavoriteRestaurant(Request $request)
    {
        $userId = User::select('id')->where('name', session('name'))->first();
        RestaurantUser::where('restaurant_id', $request->favorite)->where('user_id', $userId['id'])->delete();
        return redirect(url('/menu/' . $request->favorite));

    }
    public function favoriteRestaurant()
    {

        $reviewArr = [];

        $userId = User::select('id')->where('name', session('name'))->first();
        $items = User::find($userId['id'])->restaurants()->paginate(12);
        // \DB::statement("SET SQL_MODE=''");

        // $items = DB::table('reviews')
        //     ->join('restaurants', 'reviews.restaurant_id', '=', 'restaurants.id')
        //     ->select('restaurants.*', DB::raw('avg(rate)as avg'))->groupBy('reviews.restaurant_id')->orderBy('avg', 'desc')->paginate(12);

        // dd($items);
        $reviews = Review::get();
        foreach ($reviews as $review) {
            array_push($reviewArr, $review->restaurant_id . $review->user_id);
        }
        return view('index', compact('items', 'reviews', 'userId', 'reviewArr'));
    }
}