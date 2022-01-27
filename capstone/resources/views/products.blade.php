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
			<h1>Category List</h1>
		</div>
		<div class="col-md-2">
			<a href="{{ route('categories.create') }}" class="btn btn-lg btn-block btn-primary btn-h1-spacing">Add Category</a>
		</div>
		<div class="col-md-12">
			<hr />
		</div>
	</div>

	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<table class="table">
				<thead>
					<th>&nbsp;&nbsp;&nbsp;#</th>
					<th>Name</th>
				</thead>
				<tbody>
					<?php 
						$i = 1;    
					?>
					@foreach ($categories as $category)
						<tr>
							<td><a href='/categories/{{ $category->id }}' class='btn btn-secondary' role='button'>{{ $i++ }}</a></td>
							<td>{{ $category->category }}</td>
						</tr>
						@endforeach
				</tbody>
			</table>
		</div> <!-- end of .col-md-8 -->
	</div>
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<h1>All Items</h1>
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
					<th>&nbsp;&nbsp;&nbsp;#</th>
					<th>Title</th>
				</thead>
				
					<?php 
						$i = 1;    
					?>
					@foreach ($items as $item)
                    <tbody>
						<tr>
							<td><a href='/items/{{ $item->id }}' class='btn btn-secondary' role='button'>{{ $i++ }}</a></td>
							<td>{{ $item->title }}</td>
						</tr>
                    </tbody>
					@endforeach
				
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