<?php

namespace App\Http\Controllers;

use App\Models\Item;
use App\Models\ItemUser;
use App\Models\Restaurant;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use TCG\Voyager\Models\User;

// use Darryldecode\Cart\Facades\CartFacade as Cart;

class CartController extends Controller
{
    public function cartPage()
    {
        $name = Auth::user()->name;
        $email = Auth::user()->email;
        $cart = \Cart::session(Auth::user()->id)->getContent();
        $total = \Cart::session(Auth::user()->id)->getTotal();
        return view('cart', compact('name', 'email', 'cart', 'total'));
    }

    public function addCart(Request $request)
    {
        $input = $request->all();
        $Restaurant = Restaurant::find($request->resId);
        $request->session()->put('restaurant', $request->resId);

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
    protected function removeCartItem(Item $item)
    {
        \Cart::session(Auth::user()->id)->remove($item->id);
        return "removeCartItem";
    }
    public function storeCart(Request $request)
    {

        $request->session()->put('used', session('name'));

        $userId = User::select('id')->where('name', session('name'))->first();
        for ($i = 0; $i < count($request->item_id); $i++) {
            $item_user = new ItemUser;
            $item_user->user_id = $userId['id'];
            $item_user->item_id = $request->item_id[$i];
            $item_user->qty = $request->quantity[$i];
            $item_user->save();
        }

        return redirect(url('totalCart'));
    }
    public function totalCart()
    {
        $dateFrom = date('Y-m-d') . ' 00:00:00';
        $dateEnd = date('Y-m-d') . ' 23:59:59';
        $restaurant = Restaurant::find(session('restaurant'));
        // $subTotal=ItemUser::select(DB::raw('sum()'))
        $menus = DB::table('item_users')
            ->join('items', 'item_users.item_id', '=', 'items.id')
            ->join('users', 'item_users.user_id', '=', 'users.id')
            ->select('items.price', 'users.name', 'item_users.qty', 'items.name as dish')->whereBetween('item_users.created_at', [$dateFrom, $dateEnd])->get()->toArray();
        return view('totalCart', compact('menus', 'restaurant'));
    }
}