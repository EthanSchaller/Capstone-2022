<?php

namespace App\Http\Controllers;

use App\Item;
use App\ShoppingCart;
use App\OrderInfo;
use App\SoldItems;

class CompOrdersController extends Controller
{
    public function index() {
        $orders = OrderInfo::orderBy('id','ASC')->paginate(10);
        return view('orders.completeOrders')->with('orders',$orders);
    }

    public function checkReceipt($id) {
        $orders = OrderInfo::where('id', $id)->paginate(10);
        $shopping_cart = ShoppingCart::where('session', session()->get('session_id'))->orderBy('id', 'ASC')->paginate(10);
        $items = Item::orderBy('title','ASC')->paginate(10);

        return view('orders.receipt', ['items'=>$items,
                                'cart'=>$shopping_cart,
                                'orders'=>$orders]);
    }
}