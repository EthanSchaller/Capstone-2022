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
                    <th>Customer Name</th>
                    <th>Customer Phone</th>
                    <th>Customer Email</th>
                    <th>Ordered At</th>
                </thead>
                <tbody>
                    @foreach($orders as $order)
                        <tr>
                            {!! Form::open(['route' => [('checkReceipt'), $order->id], 'method'=>'GET']) !!}
                                <td>{{ Form::submit($order->id , ['class'=>'btn btn-sm btn-default btn-block', 'style'=>'']) }}</td>
                            {!! Form::close() !!}

                            <?php
                                $name = $order->fName;
                                $name .= " ";
                                $name .= $order->lName;
                            ?>

                            <td>{{ $name }}</td>
                            <td>{{ $order->phone }}</td>
                            <td>{{ $order->email }}</td>
                            <td>{{ $order->created_at }}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
            <div class="text-center">
                {!! $orders->links(); !!}
            </div>
        </div>
    </div>
@endsection