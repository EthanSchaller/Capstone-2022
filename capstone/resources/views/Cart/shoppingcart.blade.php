@extends('common') 

@section('pagetitle')
Shopping Cart
@endsection

@section('pagename')
Laravel Project
@endsection

@section('content')
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
						<th>Title</th>
						<th>Added At</th>
                        <th>Item(s) Price</th>
						<th>Quantity</th>
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
                                @if ($cartItem->item_id == $item->id)
                                    <tr>
                                        <td>{{ $item->title }}</td>
                                        <td>{{ $cartItem->created_at }}</td>
                                        <?php 
                                           $ttlPrice += $item->price * $cartItem->quantity
                                        ?>
                                        <td>{{ $item->price * $cartItem->quantity}}</td>
                                        <td>{{ $cartItem->quantity }}</td>
                                        <td>
                                            <select name='quantitySlct' id='quantitySlct' class='form-control' data-parsley-required="true">
                                                <option value="">{{ $cartItem->quantity }}</option>
                                                <?php 
                                                    $iQuant = 1;
                                                ?>
                                                @while($iQuant <= $item->quantity) 
                                                    @if($cartItem->quantity == $iQuant)
                                                        <option value='{{ $iQuant }}' selected>{{ $iQuant }}</option>
                                                    @else
                                                        <option value='{{ $iQuant }}'>{{ $iQuant }}</option>
                                                    @endif

                                                    <?php 
                                                        $iQuant++;
                                                    ?>
                                                @endwhile

                                            </select>
                                        </td>
                                        <td><a href="{{ route('products.index') }}" class="btn btn-sm btn-danger btn-block">Remove Item</a></td>
                                    </tr>
                                @endif
                            @endforeach
						@endforeach
                        <tr>
                            <td>Total price: {{ $ttlPrice }}</td>
                            <td></td>
                            <td></td>
                            <td><a href="{{ route('products.index') }}" class="btn btn-sm btn-success btn-block">Update Order</a></td>
                            <td><a href="{{ route('products.index') }}" class="btn btn-sm btn-primary btn-block">Check-out</a></td>
                            <td></td>
                        </tr>
					</tbody>
				</table>
                <table class="table">
                    
                </table>
				<div class="text-center">
                    {!! $items->links(); !!}
                    {!! $shopping_cart->links(); !!}
                </div>
			</div>
		</div>
	@endguest
@endsection