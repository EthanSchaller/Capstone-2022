<?php

namespace App\Http\Controllers;

use App\Item;
use App\ShoppingCart;
use App\Category;
use Session;

class CartController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $items = Item::orderBy('title','ASC')->paginate(10);
        $shopping_cart = ShoppingCart::orderBy('id', 'ASC')->paginate(10);
        return view('cart.shoppingcart')->with('shopping_cart', $shopping_cart)->with('items', $items);
    }
}