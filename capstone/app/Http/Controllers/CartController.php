<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Item;
use App\ShoppingCart;
use App\Category;
use App\OrderInfo;
use App\SoldItems;
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
        $shopping_cart = ShoppingCart::where('session', session()->get('session_id'))->orderBy('id', 'ASC')->paginate(10);
        return view('cart.shoppingcart')->with('shopping_cart', $shopping_cart)->with('items', $items);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function addToCart($id) {
        $cartItem = new ShoppingCart();
        $cartItem->item_id = $id;
        $cartItem->quantity = 1;
        $cartItem->session = session()->get('session_id');
        $cartItem->ip = session()->get('ip_address');
        
        $cartItem->save(); //saves to DB
    
        Session::flash('success','The item has been added');
    
        return redirect()->route('cart.index');
    }

     /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function updateCartItem($id) {
        $newQuant = null;
    
        if(isset($_GET["quantitySlct"])) {
            $newQuant = $_GET["quantitySlct"];
        }
    
        if($newQuant != null) {
            $cartItem = ShoppingCart::find($id);
            $cartItem->quantity = $newQuant;
    
            $cartItem->save(); //saves to DB
    
            Session::flash('success','The cart item has been updated');
        }
    
        return back();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function deleteCartItem($id) {
        $cartItem = ShoppingCart::find($id);
        $cartItem->delete();
    
        Session::flash('success','The cart item has been deleted');
    
        return back();
    }
    
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function checkOutCart(Request $request) {
        if(!session()->has('session_id')) {
            return redirect()->route('products.index');
        }
        
        if(isset($_GET['fName']) && isset($_GET['lName']) && isset($_GET['phone']) && isset($_GET['email'])) {
            $fName = $_GET['fName'];
            $lName = $_GET['lName'];
            $phone = $_GET['phone'];
            $email = $_GET['email'];
            
            $validated = $this->validate($request, ['fName'=>'required|string|max:255',
                                       'lName'=>'required|string|max:255',
                                       'phone'=>'required|regex:/^([0-9\s\-\+\(\)]*)$/|min:10',
                                       'email'=>'required|email|max:255']);
       
            if($validated) {
                $order = new OrderInfo;
                $order->fName = $fName;
                $order->lName = $lName;
                $order->phone = $phone;
                $order->email = $email;
                $order->session_id = $request->session;
                $order->ip_address = session()->get('ip_address');

                $order->save();

                CartController::sellitems($request, $order);

                $shopping_cart = ShoppingCart::where('session', session()->get('session_id'))->orderBy('id', 'ASC')->paginate(10);
                $items = Item::orderBy('title','ASC')->paginate(10);
        
                return view('thankPage', ['items'=>$items,
                                          'cart'=>$shopping_cart,
                                          'order'=>$order]);
            }
        }

        return back();
    }
    

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function sellItems(Request $request, $order) {
        $shopping_cart = ShoppingCart::where('session', session()->get('session_id'))->orderBy('id', 'ASC')->paginate(10);
        
        foreach($shopping_cart as $cartItem) {
            $ips = ($order->ip_address == $cartItem->ip);
            $deleted = ($cartItem->deleted_at == NULL);

            if($ips && $deleted) {
                $item = Item::find($cartItem->item_id);

                $soldItem = new SoldItems;
                $soldItem->id_item = $cartItem->item_id;
                $soldItem->id_order = $order->id;
                $soldItem->ttlPrice = ($item->price * $cartItem->quantity);
                $soldItem->quantity = $cartItem->quantity;

                $soldItem->save();
            }
        }
    }
}