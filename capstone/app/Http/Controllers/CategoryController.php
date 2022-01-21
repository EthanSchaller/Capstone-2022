<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Category;
use App\Item;
use Session;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categories = Category::orderBy('category','ASC')->paginate(10);
        $items = Item::orderBy('title','ASC')->paginate(10);
        return view('categories.index')->with('categories',$categories)->with('items',$items);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('categories.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //validate the data
        // if fails, defaults to create() passing errors
        $this->validate($request, ['category'=>'required|max:100|unique:categories,category']); 

        //send to DB (use ELOQUENT)
        $category = new Category;
        $category->category = $request->category;
        $category->save(); //saves to DB

        Session::flash('success','The category has been added');

        //redirect
        return redirect()->route('categories.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $category = Category::find($id);
        return view('categories.edit')->with('category',$category);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //validate the data
        // if fails, defaults to create() passing errors
        $category = Category::find($id);
        $this->validate($request, ['category'=>"required|max:100|unique:categories,category,$id"]);             

        //send to DB (use ELOQUENT)
        $category->category = $request->category;

        $category->save(); //saves to DB

        Session::flash('success','The category has been updated');

        //redirect
        return redirect()->route('categories.index');
        
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $items = Item::orderBy('title','ASC')->paginate(10);
        $category = Category::find($id);
        $iTemp = 0;  
        foreach($items as $item)
        {
            if($category->id == $item->category_id) 
            {
            $iTemp++;
            }
        }  

        if($iTemp == 0)
        {
            $category->delete();

            Session::flash('success','The category has been deleted');   
        }
        
        return redirect()->route('categories.index');

    }
}
