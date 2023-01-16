<?php

namespace App\Http\Controllers;

use App\Models\Item;
use App\Models\Restaurant;
use App\Models\Review;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SiteController extends Controller
{
    public function index()
    {

        $userId = User::select('id')->where('name', session('name'))->first();
        $reviewArr = [];
        \DB::statement("SET SQL_MODE=''");
        $items = DB::table('reviews')
            ->join('restaurants', 'reviews.restaurant_id', '=', 'restaurants.id')
            ->select('restaurants.*', DB::raw('avg(rate)as avg'))->groupBy('reviews.restaurant_id')->orderBy('avg', 'desc')->paginate(12);
        $reviews = Review::get();
        foreach ($reviews as $review) {
            array_push($reviewArr, $review->restaurant_id . $review->user_id);
        }
        return view('index', compact('items', 'reviews', 'userId', 'reviewArr'));
    }

    public function searchRestaurant(Request $request)
    {
        $items = Restaurant::where('name', 'like', '%' . $request->search . '%')->paginate(12);

        $userId = User::select('id')->where('name', session('name'))->first();
        $reviewArr = [];

        $reviews = Review::get();
        foreach ($reviews as $review) {
            # code...
            array_push($reviewArr, $review->restaurant_id . $review->user_id);
        }
        return view('index', compact('items', 'reviews', 'userId', 'reviewArr'));
    }
    public function getMenu($id)
    {
        $items = Item::where('restaurant_id', $id)->where('enabled', true)->orderBy('sort', 'asc')->get();
        $resId = $id;
        $res = Restaurant::find($id);
        $reviews = Review::where('restaurant_id', $id)->get();
        // $menus = $res->items;
        // dd(view('menu', compact('menus', 'resId')));
        return view('menu', compact('items', 'resId', 'res', 'reviews'));
    }

    public function getOrder(Request $request)
    {
        dd($request->all());
    }
    public function wrongMenu()
    {
        $restaurant = Restaurant::find(session('restaurant'));
        flash('今天的餐廳是‘' . $restaurant->name . '’!!')->error();
        $items = Restaurant::get();
        return view('index', compact('items'));

    }
    public function alreadyOrder()
    {
        flash('你已經點過了’!!')->error();
        $items = Restaurant::get();
        return view('index', compact('items'));

    }

}