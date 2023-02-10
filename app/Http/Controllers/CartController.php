<?php

namespace App\Http\Controllers;

use App\Models\Item;
use App\Models\ItemOrder;
use App\Models\Order;
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
            if ($request->quantity[$i] == 0) {
                continue;
            }
            \Cart::session(Auth::user()->id)->add([
                'id' => intval($request->id[$i]),
                'name' => $request->name[$i],
                'price' => intval($request->price[$i]),
                'quantity' => intval($request->quantity[$i]),
                'attributes' => $request->note,
                'associatedModel' => $Restaurant,
            ]);
        }
        session()->flash('message', __('點餐成功'));
        // return redirect()->back()->withInput($input);
        return redirect(url('cart'));
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
        // $OrderId = Order::select('id')->where('user_id', session('users'))->first();
        $Order = new Order;
        $OrderId = $Order->user_id = $userId['id'];
        $Order->save();
        // dd($Order);
        for ($i = 0; $i < count($request->item_id); $i++) {
            $item_order = new ItemOrder;
            $item_order->order_id = $OrderId;
            $item_order->item_id = $request->item_id[$i];
            $item_order->qty = $request->quantity[$i];
            $item_order->save();
        }
        return redirect(route('totalCart'));
    }
    public function totalCart()
    {
        $dateFrom = date('Y-m-d') . ' 00:00:00';
        $dateEnd = date('Y-m-d') . ' 23:59:59';
        $restaurant = Restaurant::find(session('restaurant'));
        // dd($restaurant);
        // $subTotal=ItemUser::select(DB::raw('sum()'))
        $menus = DB::table('orders')
            ->join('users', 'orders.user_id', '=', 'users.id')
            ->join('item_order', 'item_order.order_id', '=', 'orders.id')
            ->join('items', 'item_order.item_id', '=', 'items.id')
            ->select('items.price', 'users.name', 'item_order.qty', 'items.name as dish')
            ->whereBetween('item_order.created_at', [$dateFrom, $dateEnd])
            ->get()->toArray();
        if ($menus == null) {
            flash('還沒有人點餐!')->error();
            return redirect(route('index'));
        }
        return view('totalCart', compact('menus', 'restaurant'));
    }
}