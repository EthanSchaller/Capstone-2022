@extends('common') 

@section('pagetitle')
Item List
@endsection

@section('pagename')
Laravel Project
@endsection

@section('content')
    @guest
        <p>You are currently logged out. Please login to access the website</p>
        <a href='/login' class='btn btn-default' role='button'>Login</a>
    @else
        <p>This is the Shopping Cart Page for now (Next Update Should Have it done <br \> (Maybe (Maybe not (Who Knows (this is just for the absurd amount of brackets (and one more for the road)))))) :)</p>
    @endguest
@endsection