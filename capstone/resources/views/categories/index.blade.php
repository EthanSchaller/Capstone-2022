@extends('common') 

@section('pagetitle')
categories List
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
						<th>Category ID</th>
						<th>Name</th>
						<th>Created At</th>
						<th>Last Modified</th>
						<th></th>
					</thead>
					<tbody>
						<?php 
							$i = 1;    
						?>
						@foreach ($categories as $category)
							<tr>
								<th>{{ $i++ }}</th>
								<td>{{ $category->category }}</td>
								<td>{{ date('M j, Y', strtotime($category->created_at)) }}</td>
								<td>{{ date('M j, Y', strtotime($category->updated_at)) }}</td>
								<td><div style='float:left; margin-right:5px;'><a href="{{ route('categories.edit', $category->id) }}" class="btn btn-success btn-sm">Edit</a></div><div style='float:left;'>
									<?php 
										$i2 = 0;  
										foreach($items as $item)
										{
											if($category->id == $item->category_id) 
											{
											$i2++;
											}
										}  
									?>
									
									@if($i2 == 0)
										{!! Form::open(['route' => ['categories.destroy', $category->id], 'method'=>'DELETE']) !!}
											{{ Form::submit('Delete', ['class'=>'btn btn-sm btn-danger btn-block', 'style'=>'', 'onclick'=>'return confirm("Are you sure?")']) }}
										{!! Form::close() !!}
									@endif </div>
								</td>
							</tr>
							@endforeach
					</tbody>
				</table>
			</div> <!-- end of .col-md-8 -->
		</div>
    @endguest
@endsection