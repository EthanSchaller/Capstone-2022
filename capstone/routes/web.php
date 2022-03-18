<?php

use Illuminate\Support\Facades\Route;
use App\ShoppingCart;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::resource('items', '\App\Http\Controllers\ItemController')->middleware('auth');
Route::resource('categories', '\App\Http\Controllers\CategoryController')->middleware('auth');
Route::resource('products', '\App\Http\Controllers\ProductsController');
Route::resource('cart', '\App\Http\Controllers\CartController')->middleware('auth');
Route::get('/cart/add/{id}', function ($id) {
    $cartItem = new ShoppingCart();
    $cartItem->item_id = $id;
    $cartItem->quantity = 1;
    $cartItem->session = session()->get('session_id');
    $cartItem->ip = session()->get('ip_address');
    
    $cartItem->save(); //saves to DB

    Session::flash('success','The item has been added');

    return redirect()->route('cart.index');
})->name('addToCart');

Route::get('/cart/update/{id}/', function ($id) {
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
})->name('updateCart');

Route::get('/cart/delete/{id}/', function ($id) {
    $cartItem = ShoppingCart::find($id);
    $cartItem->delete();

    Session::flash('success','The cart item has been deleted');

    return back();
})->name('deleteCartItem');

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
