<?php

namespace App\Http\Controllers;

use App\Models\Item;
use App\Models\Restaurant;
use Illuminate\Http\Request;

class SiteController extends Controller
{
    public function index()
    {
        $items = Restaurant::get();
        return view('index', compact('items'));
    }

    public function getMenu($id)
    {
        $items = Item::where('restaurant_id', $id)->where('enabled', true)->orderBy('sort', 'asc')->get();
        $resId = $id;
        // $res = Restaurant::find($id);
        // $menus = $res->items;
        // dd(view('menu', compact('menus', 'resId')));
        return view('menu', compact('items', 'resId'));
    }

    public function getOrder(Request $request)
    {
        dd($request->all());
    }

}