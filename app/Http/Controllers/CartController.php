<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CartController extends Controller
{
  public function cartPage()
  {
    $cart = \Cart::session(Auth::user()->id)->getContent();
    $total = \Cart::session(Auth::user()->id)->getTotal();
      return redirect(url('cart','total'));

  }

  public function addCart()
  {
     \Cart::session(Auth::user()->id)->add([
            'id' => $item->id,
            'name' => $item->title,
            'price' => $item->price_new,
            'quantity' => $quantity,
            'attributes' => [],
            'associatedModel' => $item
        ]);
        return redirect(url('cart'));
     }

  public function updateCart()
  {
    \Cart::session(Auth::user()->id)->update($item->id,[
	          'id' => $item->id,
            'name' => $item->title,
            'price' => $item->price_new,
            'quantity' => $quantity,
            'attributes' => [],
            'associatedModel' => $item
        ]);
     return redirect(url('cart'));
  }

  public function clearAllCart()
  {
    \Cart::session()->clear();
    return redirect(url('cart'));
  }

  public function removeCart()
  {
    \Cart::session(Auth::user()->id)->remove($item->id);
      return redirect(url('cart'));
  }

  public function showCart()
  {
    \Cart::session(Auth::user()->id)->show($item->id,[
	          'id' => $item->id,
            'name' => $item->title,
            'price' => $item->price_new,
            'quantity' => $quantity,
            'attributes' => [],
            'associatedModel' => $item
        ]);
     return redirect(url('cart'));
  }

}