@extends('common') 

@section('pagetitle')
Item List
@endsection

@section('pagename')
Laravel Project
@endsection

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-sm-8 col-md-8 col-lg-8">
                <div class="card-header">Item #{{ $item->id }}</div>
                        <div class="thumbnail" style="text-align: center">
                            <div class="img-thumbnail"><img src="{{ URL('storage/images/items/lrg_'.$item->picture) }}" alt="{{ $item->picture }}"></div>
                            <div>{{ $item->title }}</div>
                            <div>SKU: {{ $item->sku }}</div>
                            <div>{{ $item->category_id }}</div>
                            <div class="thumbnail" style="text-align: center">{!! $item->description !!}</div>
                            <div>${{ $item->price }}</div>
                            <div>Quantity: {{ $item->quantity }}</div>
                        </div>
                </div>
            </div>
        </div>
    </div>
@endsection