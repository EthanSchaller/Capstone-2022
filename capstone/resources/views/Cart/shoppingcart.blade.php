@extends('common') 

@section('pagetitle')
Shopping Cart
@endsection

@section('pagename')
Laravel Project
@endsection

@section('content')
    <?php
        if(isset($_POST['quantitySlct'])){
            $quantitySlct = $_POST['quantitySlct'];
            switch ($quantitySlct) {
                case 1:
                    echo 'this is value1<br/>';
                    break;
                case 2:
                    echo 'value2<br/>';
                    break;
                default:
                    echo 'value3+<br/>';
                    break;
            }
        }
    ?>

	@guest
		<p>You are currently logged out. Please login to access the website</p>
		<a href='/login' class='btn btn-default' role='button'>Login</a>
	@else
        <div class="row">
			<div class="col-md-8 col-md-offset-2">
				<h1>Shopping Cart</h1>
			</div>
			<div class="col-md-12">
				<hr />
			</div>
		</div>

		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<table class="table">
					<thead>
						<th>Item Title</th>
						<th>Added At</th>
                        <th>Item(s) Price</th>
						<th>Quantity</th>
                        <th>Change Quantity</th>
                        <th></th>
                        <th></th>
					</thead>
					<tbody>
						<?php 
							$i = 1; 
                            $ttlPrice = 0; 
						?>
						@foreach ($shopping_cart as $cartItem)
                            @foreach ($items as $item)
                                @if ($cartItem->item_id == $item->id && $cartItem->session == session()->get('session_id') && $cartItem->ip == session()->get('ip_address'))
                                    <tr>
                                        <td>{{ $item->title }}</td>
                                        <td>{{ $cartItem->created_at }}</td>
                                        <?php 
                                           $ttlPrice += $item->price * $cartItem->quantity
                                        ?>
                                        <td>{{ $item->price * $cartItem->quantity}}</td>
                                        <td>{{ $cartItem->quantity }}</td>
                                        {!! Form::open(['route' => [('updateCartItem'), $cartItem->id], 'method'=>'GET']) !!}
                                            <td>{{ Form::selectRange('quantitySlct', 1, $item->quantity, $cartItem->quantity) }}</td>
                                            <td>{{ Form::submit('Update Order', ['class'=>'btn btn-sm btn-success btn-block', 'style'=>'']) }}
                                        {!! Form::close() !!}
                                        <td><a href="{{ route('deleteCartItem', $cartItem->id) }}" class="btn btn-sm btn-danger btn-block">Remove Item</a></td>
                                    </tr>
                                @endif
                            @endforeach
						@endforeach
                        <tr>        
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>Total: ${{ $ttlPrice }}</td>   
                            {!! Form::open(['route' => [('checkOutCart'), session()->get('session_id')], 'method'=>'GET']) !!}
                                <td>{{ Form::submit('Check-out', ['class'=>'btn btn-sm btn-primary btn-block', 'style'=>'']) }}</td>
                        </tr>
					</tbody>
				</table>
                <table class="table">
                    <thead>
						<th>Customer Info Form</th>
						<th style="text-align: right">(Required For Check-out)</th>
					</thead>
                    <tbody>
                        <tr>
                            <td>
                                {{ Form::label('fName', 'Fisrt Name:') }}
                                {{ Form::text('fName', null, ['class'=>'form-control', 'style'=>'', 
                                                            'data-parsley-required'=>'', 
                                                            'data-parsley-maxlength'=>'255']) }}
                            </td>
                            <td>
                                {{ Form::label('lName', 'Last Name:') }}
                                {{ Form::text('lName', null, ['class'=>'form-control', 'style'=>'', 
                                                            'data-parsley-required'=>'', 
                                                            'data-parsley-maxlength'=>'255']) }}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                {{ Form::label('phone', 'Phone Number:') }}
                                {{ Form::text('phone', null, ['class'=>'form-control', 'style'=>'', 
                                                            'data-parsley-required'=>'']) }}
                            </td>
                            <td>
                                {{ Form::label('email', 'Email Address:') }}
                                {{ Form::text('email', null, ['class'=>'form-control', 'style'=>'', 
                                                            'data-parsley-required'=>'']) }}
                            </td>
                        </tr>
                    </tbody>
                    {!! Form::close() !!}   
                </table>
				<div class="text-center">
                    {!! $shopping_cart->links(); !!}
                </div>
			</div>
		</div>
	@endguest
@endsection