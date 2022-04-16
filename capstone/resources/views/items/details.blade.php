@extends('common') 

@section('pagetitle')
Item List
@endsection

@section('pagename')
Laravel Project
@endsection

@section('content')
    <?php
        if (!session()->has('session_id')) {
            session()->put('session_id', session_create_id());
            session()->put('ip_address', request()->getClientIp());
        }
    ?>
    <div class="container" style="text-align: center">
        <div class="row justify-content-center">
            <div class="col-sm-8 col-md-8 col-lg-8">
                <div class="card-header">Item #{{ $item->id }}</div>
                    <div class="thumbnail">
                        <div class="img-thumbnail"><img src="{{ URL('storage/images/items/lrg_'.$item->picture) }}" alt="{{ $item->picture }}"></div>
                        <div>{{ $item->title }}</div>
                        <div>SKU: {{ $item->sku }}</div>
                        <div>{{ $item->category_id }}</div>
                        <div class="thumbnail">{!! $item->description !!}</div>
                        <div>${{ $item->price }}</div>
                        <div>Quantity: {{ $item->quantity }}</div>
                    </div>
                    <table class="table">    
                        <tbody>
                            <tr>
                                <td>
                                    {!! Form::open(['route' => [('addToCart'), $item->id], 'method'=>'GET']) !!}
                                        {{ Form::submit('Add To Cart', ['class'=>'btn btn-sm btn-primary btn-block', 'style'=>'']) }}
                                    {!! Form::close() !!}
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection