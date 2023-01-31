<?php

namespace App\Http\Controllers;

use App\Models\Item;
use App\Models\Restaurant;
use App\Models\RestaurantUser;
use App\Models\Review;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class SiteController extends Controller
{
    public function index(Request $request)
    {
        $userId = Auth::user();

        $reviewArr = [];
        DB::statement("SET SQL_MODE=''");
        $newItems = DB::table('restaurants')
            ->leftJoin('reviews', 'reviews.restaurant_id', '=', 'restaurants.id')
            ->select('restaurants.*', DB::raw('null as avg'))
            ->whereNull('rate');
        $items = DB::table('reviews')
            ->join('restaurants', 'reviews.restaurant_id', '=', 'restaurants.id')
            ->select('restaurants.*', DB::raw('avg(rate)as avg'))
            ->groupBy('reviews.restaurant_id')
            ->orderBy('avg', 'desc');
        $items = $newItems->union($items)->paginate(12);
        // $items = $items->union($newItems)->paginate(12);

        $reviews = Review::get();
        foreach ($reviews as $review) {
            array_push($reviewArr, $review->restaurant_id . $review->user_id);
        }
        $isAdmin = $this->isAdmin();
        return view('index', compact('isAdmin', 'items', 'reviews', 'userId', 'reviewArr'));
    }
    public function isAdmin()
    {
        $admin = 1;
        if (Auth::user()->role_id != $admin) {
            return false;
        }
        return true;
    }
    public function searchRestaurant(Request $request)
    {
        $items = Restaurant::where('name', 'like', '%' . $request->search . '%')->paginate(12);

        $userId = User::select('id')->where('name', session('name'))->first();
        $reviewArr = [];

        $reviews = Review::get();
        foreach ($reviews as $review) {
            array_push($reviewArr, $review->restaurant_id . $review->user_id);
        }

        $isAdmin = false;

        return view('index', compact('isAdmin', 'items', 'reviews', 'userId', 'reviewArr'));
    }
    public function getMenu($id)
    {
        $userId = Auth::user()->id;

        $favoriteArr = [];
        $favorites = RestaurantUser::get();
        foreach ($favorites as $favorite) {
            array_push($favoriteArr, $favorite->restaurant_id . $favorite->user_id);
        }

        $items = Item::where('restaurant_id', $id)->where('enabled', true)
            ->orderBy('sort', 'asc')->get();
        $resId = $id;
        $res = Restaurant::find($id);

        $reviews = Review::where('restaurant_id', $id)->get();

        return view('menu', compact('items', 'resId', 'res', 'reviews', 'favoriteArr', 'userId'));
    }

    public function getOrder(Request $request)
    {
        dd($request->all());
    }
    public function wrongMenu()
    {
        $restaurant = Restaurant::find(session('restaurant'));
        flash('今天的餐廳是' . $restaurant->name . '!!')->error();
        $items = Restaurant::get();
        return redirect(url('/'));

    }
    public function alreadyOrder()
    {
        flash('你已經點過了!')->error();
        $items = Restaurant::get();
        return redirect(url('/'));

    }

}