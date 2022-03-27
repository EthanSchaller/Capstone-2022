@extends('common') 

@section('pagetitle')
Order Receipt
@endsection

@section('pagename')
Laravel Project
@endsection

@section('content')
    <a href='/CompleteOrders' class='btn btn-default' type='button'><-Back</a>
    
    @foreach($orders as $order)
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <h1>Receipt #{{ $order->id }}</h1>
            </div>
            <div class="col-md-12">
                <hr />
            </div>
        </div>

        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <table class="table">
                    <thead>
                        <th>User Info</th>
                        <th></th>
                        <th></th>
                    </thead>
                    <tbody>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Email</th>
                    </tbody>
                    <tbody>
                        <?php
                            $name = $order->fName;
                            $name.= " ";
                            $name.= $order->lName;
                        ?>

                        <td>{{ $name }}</td>
                        <td>{{ $order->phone }}</td>
                        <td>{{ $order->email }}</td>
                    </tbody>
                </table>
                <table class="table">
                    <thead>
                        <th>Items Ordered</th>
                        <th></th>
                        <th></th>
                    </thead>
                    <tbody>
                        <th>Item Name</th>
                        <th>Quantity Ordered</th>
                        <th>Item(s) Price</th>
                    </tbody>
                    <tbody>
                        <?php
                            $ttlPrice = 0;    
                        ?>
                        @foreach($cart as $cartInfo)
                            @foreach($items as $item)
                                @if($item->id == $cartInfo->item_id)
                                    <tr>
                                        <td>{{ $item->title }}</td>
                                        <td>{{ $cartInfo->quantity }}</td>
                                        <?php 
                                            $ttlPrice += $item->price * $cartInfo->quantity
                                        ?>
                                        <td>${{ $item->price * $cartInfo->quantity }}</td>
                                    </tr>
                                @endif
                            @endforeach
                        @endforeach
                    </tbody>
                    <tbody>
                        <td>Total Price:</td>
                        <td></td>
                        <td>${{ $ttlPrice }}</td>
                    </tbody>
                    
                </table>
            </div>
        </div>
    @endforeach
@endsection
