@extends('common') 

@section('pagetitle')
Item List
@endsection

@section('pagename')
Laravel Project
@endsection

@section('content')
@if(Auth::user())
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<h1>{{ $category->category }}</h1>
		</div>
		<div class="col-md-2">
			<a href="{{ route('items.create') }}" class="btn btn-lg btn-block btn-primary btn-h1-spacing">Create New Item</a>
		</div>
		<div class="col-md-12">
			<hr />
		</div>
	</div>

	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<table class="table">
				<thead>
					<th>#</th>
					<th>Title</th>
				</thead>
				<tbody>
					<?php 
						$i = 1;    
					?>
					@foreach ($items as $item)
                        @if($item->category_id == $cat_id)
						<tr>
							<th><a href='/items/{{ $item->id }}' class='btn btn-secondary' role='button'>{{ $i++ }}</a></th>
							<td>{{ $item->title }}</td>
						</tr>
                        @endif
					@endforeach
				</tbody>
			</table>
			<div class="text-center">
				{!! $items->links(); !!}
			</div>
		</div>
	</div>
	@else
	<p>You are currently logged out. Please login to access the website</p>
	<a href='/login' class='btn btn-default' role='button'>Login</a>
	@endif
@endsection