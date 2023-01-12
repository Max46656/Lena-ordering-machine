<?php

namespace App\Http\Controllers;

use App\Models\Resturant;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class SiteController extends Controller
{
    public function index()
    {
        $items = Resturant::get();
        return view('index', compact('items'));
    }
    public function addResturant()
    {
        return redirect('/admin/resturants/create');

    }
    public function addMenu()
    {
        return redirect('/admin/resturant-menus/create');

    }
    public function Menu($id)
    {$resId = $id;
        $res = Resturant::find($id);
        $menus = $res->resturant_menus;
        return view('menu', compact('menus', 'resId'));

    }
    public function getMenu(Request $request)
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
        $resturant = Resturant::find($request->resId);
        for ($i = 0; $i < count($request->id); $i++) {
            # code...

            \Cart::session(Auth::user()->id)->add([
                'id' => $request->id[$i],
                'name' => $request->name[$i],
                'price' => $request->price[$i],
                'quantity' => $request->quantity[$i],
                'attributes' => [],
                'associatedModel' => $resturant,
            ]);
        }
        return redirect(url('carts'));

    }

}