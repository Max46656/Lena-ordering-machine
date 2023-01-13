<?php

namespace App\Http\Controllers;

use App\Models\Item;
use App\Models\Restaurant;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

// use Darryldecode\Cart\Facades\CartFacade as Cart;

class CartController extends Controller
{
    public function cartPage()
    {
        $cart = \Cart::session(Auth::user()->id)->getContent();
        $total = \Cart::session(Auth::user()->id)->getTotal();
        return view('Cart', compact('cart', 'total'));
    }

    public function addCart(Request $request)
    {
        $input = $request;
        $Restaurant = Restaurant::find($request->resId);
        for ($i = 0; $i < count($request->id); $i++) {
            // dd(settype($request->id[$i], "integer"), settype($request->name[$i], "integer"), settype($request->price[$i], "integer"), settype($request->quantity[$i], "integer"));
            \Cart::session(Auth::user()->id)->add([
                'id' => intval($request->id[$i]),
                'name' => $request->name[$i],
                'price' => intval($request->price[$i]),
                'quantity' => intval($request->quantity[$i]),
                'associatedModel' => $Restaurant,
            ]);
        }
        session()->flash('message', __('點餐成功'));
        return redirect()->back()->withInput($input);
    }

    public function updateCart(Request $request)
    {
        $Restaurant = Restaurant::find($request->resId);
        for ($i = 0; $i < count($request->id); $i++) {
            $item = Item::find($request->id[$i]);
            if ($request->quantity[$i] == 0) {
                $this->removeCartItem($item);
                continue;
            }
            \Cart::session(Auth::user()->id)->update($item->id,
                [
                    'quantity' => [
                        'relative' => false,
                        'value' => $request->quantity[$i],
                    ],
                    'associatedModel' => $Restaurant,
                ]
            );
        }
        session()->flash('message', '修改餐點成功!');
        return redirect(url('cart'));
    }
    public function clearAllCart()
    {
        \Cart::session(Auth::user()->id)->clear();
        return redirect(url('cart'));
    }
    public function removeCartItem(Item $item)
    {
        \Cart::session(Auth::user()->id)->remove($item->id);
        return "removeCartItem";
    }
}
