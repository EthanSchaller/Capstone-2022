<?php

use Illuminate\Support\Facades\Route;
use App\SoldItems;
use App\Item;

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

Route::get('/cart/add/{id}', [App\Http\Controllers\CartController::class, 'addToCart'])->name('addToCart');
Route::get('/cart/update/{id}', [App\Http\Controllers\CartController::class, 'updateCartItem'])->name('updateCartItem');
Route::get('/cart/delete/{id}', [App\Http\Controllers\CartController::class, 'deleteCartItem'])->name('deleteCartItem');
Route::get('/cart/checkout/{session}', [App\Http\Controllers\CartController::class, 'checkOutCart'])->name('checkOutCart');
Route::get('/cart/Receipt/', [App\Http\Controllers\CartController::class, 'orderReceipt'])->name('orderReceipt');

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::get('/CompleteOrders', function() {
    $SoldItems = SoldItems::orderBy('id','ASC')->paginate(10);
    $items = Item::orderBy('id','ASC')->paginate(10);
    return view('orders.completeOrders')->with('soldItems',$SoldItems)->with('items',$items);
})->middleware('auth');

Route::resource('items', '\App\Http\Controllers\ItemController')->middleware('auth');
Route::resource('categories', '\App\Http\Controllers\CategoryController')->middleware('auth');
Route::resource('products', '\App\Http\Controllers\ProductsController');
Route::resource('cart', '\App\Http\Controllers\CartController')->middleware('auth');
