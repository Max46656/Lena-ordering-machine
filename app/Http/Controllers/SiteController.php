<?php

namespace App\Http\Controllers;

use App\Models\Restaurant;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class SiteController extends Controller
{
    public function index()
    {
        $items = Restaurant::get();
        return view('index', compact('items'));
    }
    public function Menu($id)
    {$resId = $id;
        $res = Restaurant::find($id);
        $menus = $res->restaurant_menus;
        return view('menu', compact('menus', 'resId'));

    }
    public function getOrder(Request $request)
    {
        dd($request->all());
    }
    public function cartPage()
    {
        $cart = \Cart::session(Auth::user()->id)->getContent();
        $total = \Cart::session(Auth::user()->id)->getTotal();
        return view('cart', compact('cart', 'total'));
    }
    public function addCart(Request $request)
    {
        $Restaurant = Restaurant::find($request->resId);
        for ($i = 0; $i < count($request->id); $i++) {
            # code...

            \Cart::session(Auth::user()->id)->add([
                'id' => $request->id[$i],
                'name' => $request->name[$i],
                'price' => $request->price[$i],
                'quantity' => $request->quantity[$i],
                'attributes' => [],
                'associatedModel' => $Restaurant,
            ]);
        }
        return redirect(url('carts'));

    }

}
