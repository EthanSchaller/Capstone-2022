<?php

namespace App\Http\Controllers;

use App\Item;
use App\Category;

class ProductsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categories = Category::orderBy('category','ASC')->paginate(10);
        $items = Item::orderBy('id','ASC')->paginate(10);
        return view('products')->with('categories',$categories)->with('items',$items);
    }

}
