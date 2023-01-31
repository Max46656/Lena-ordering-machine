<?php

namespace App\Http\Controllers;

use App\Models\RestaurantUser;
use App\Models\Review;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class FavoriteController extends Controller
{
    public function addFavoriteRestaurant(Request $request)
    {
        $userId = Auth::user();

        $favorite = new RestaurantUser;
        $favorite->restaurant_id = $request->favorite;
        $favorite->user_id = $userId->id;
        $favorite->save();
        return redirect(route('getMenu', ['id' => $request->favorite]));
    }
    public function deleteFavoriteRestaurant(Request $request)
    {
        $userId = User::select('id')->where('name', session('name'))->first();
        RestaurantUser::where('restaurant_id', $request->favorite)
            ->where('user_id', $userId->id)->delete();
        return redirect(url('/menu/' . $request->favorite));

    }
    public function favoriteRestaurant()
    {

        $reviewArr = [];

        $userId = User::select('id')->where('name', session('name'))->first();
        $items = User::find($userId['id'])->restaurants()->paginate(12);
        $isAdmin = $this->isAdmin();

        // \DB::statement("SET SQL_MODE=''");

        // $items = DB::table('reviews')
        //     ->join('restaurants', 'reviews.restaurant_id', '=', 'restaurants.id')
        //     ->select('restaurants.*', DB::raw('avg(rate)as avg'))->groupBy('reviews.restaurant_id')->orderBy('avg', 'desc')->paginate(12);

        // dd($items);
        $reviews = Review::get();
        foreach ($reviews as $review) {
            array_push($reviewArr, $review->restaurant_id . $review->user_id);
        }
        return view('index', compact('items', 'isAdmin', 'reviews', 'userId', 'reviewArr'));
    }
    public function isAdmin()
    {
        $admin = 1;
        if (Auth::user()->role_id != $admin) {
            return false;
        }
        return true;
    }
}