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
    
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {   
        $cartItem = new ShoppingCart();
        $cartItem->item_id = $id;
        $cartItem->quantity = 1;
        $cartItem->session = session()->get('session_id');
        $cartItem->ip = session()->get('ip_address');
        

        $cartItem->save(); //saves to DB

        Session::flash('success','The item has been added');

        return redirect()->route('cart.index');
    }

    
}