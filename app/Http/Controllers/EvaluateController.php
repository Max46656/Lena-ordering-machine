<?php

namespace App\Http\Controllers;

use App\Models\Restaurant;
use App\Models\Review;
use App\Models\User;
use Illuminate\Http\Request;

class EvaluateController extends Controller
{
    public function evaluate($id)
    {
        $restaurant = Restaurant::find($id);
        return view('evaluate', compact('restaurant'));
    }
    public function editEvaluate($res_id, $user_id)
    {
        $review = Review::where('res_id', $res_id)->where('user_id', $user_id)->first();
        return view('editEvaluate', compact('review'));
    }
    public function updateEvaluate(Request $request, $res_id, $user_id)
    {
        $review = Review::where('res_id', $res_id)->where('user_id', $user_id)->first();
        $review->rate = $request->rate;
        $review->comment = $request->comment;
        $review->save();
        return redirect(url('/'));

    }
    public function storeEvaluate(Request $request)
    {
        // dd($request->all());
        $userId = User::select('id')->where('name', session('name'))->first();

        $review = new Review;
        $review->user_id = $userId['id'];
        $review->res_id = $request->id;
        $review->comment = $request->comment;
        $review->rate = $request->rate;
        $review->save();
        $items = Restaurant::get();
        return redirect(url('/'));

    }
    public function addFavoriteRestaurant(Request $request)
    {

    }
    public function deleteFavoriteRestaurant()
    {

    }

}
