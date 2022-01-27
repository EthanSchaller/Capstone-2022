@extends('common') 

@section('pagetitle')
Item List
@endsection

@section('pagename')
Laravel Project
@endsection

@section('content')
@if(Auth::user())
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">Item #{{ $item->id }}</div>

                <div class="card-body">
                    <h1 class="pull-right"><a href='/items' class='btn btn-secondary' role='button'><-Back</a></h1>
                    <table class="table">
                        <thead>
                            <th>Picture</th>
                            <th>title</th>
                            <th>Sku</th>
                            <th>Category ID</th>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th></th>
                        </thead>
                        <tbody>
                            <tr>
                                <td><img src="{{ URL('storage/images/items/'.$item->picture) }}" alt="{{ $item->picture }}" width="100" height="133"></td>
                                <td>{{ $item->title }}</td>
                                <td>{{ $item->sku }}</td>
                                <td>{{ $item->category_id }}</td>
                                <td>{!! $item->description !!}</td>
                                <td>${{ $item->price }}</td>
                                <td>{{ $item->quantity }}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@else
<p>You are currently logged out. Please login to access the website</p>
<a href='/login' class='btn btn-default' role='button'>Login</a>
@endif
@endsection