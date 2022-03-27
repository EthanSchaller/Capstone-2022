@extends('common') 

@section('pagetitle')
Item List
@endsection

@section('pagename')
Laravel Project
@endsection

@section('content')
    <?php
        session()->put('session_id', session()->getId());
        session()->put('ip_address', request()->getClientIp());

        $session = session()->get('session_id');
    ?>
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <h1>All Sold Items</h1>
        </div>
        <div class="col-md-12">
            <hr />
        </div>
    </div>
    
                
        
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <table class="table">
                <thead>
                    <th>Order ID</th>
                    <th>Item Name</th>
                    <th>Quantity Ordered</th>
                    <th>Total Price</th>
                    <th></th>
                </thead>
                <tbody>
                    @foreach($soldItems as $soldItem)
                        @foreach($items as $item)
                            @if($item->id == $soldItem->id_item)
                                <tr>
                                    {!! Form::open(['route' => [('checkReceipt'), $soldItem->id_order], 'method'=>'GET']) !!}
                                        <td>{{ Form::submit($soldItem->id_order , ['class'=>'btn btn-sm btn-default btn-block', 'style'=>'']) }}</td>
                                    {!! Form::close() !!}
                                    <td>{{ $item->title }}</td>
                                    <td>{{ $soldItem->quantity }}</td>
                                    <td>{{ $soldItem->ttlPrice }}</td>
                                </tr>
                            @endif
                        @endforeach
                    @endforeach
                </tbody>
            </table>
            <div class="text-center">
                {!! $items->links(); !!}
            </div>
        </div>
    </div>
@endsection