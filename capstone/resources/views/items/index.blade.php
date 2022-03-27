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
	?>

	@guest
		<p>You are currently logged out. Please login to access the website</p>
		<a href='/login' class='btn btn-default' role='button'>Login</a>
	@else 
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<h1>All Items</h1>
			</div>
			<div class="col-md-2">
				<a href="{{ route('items.create') }}" class="btn btn-lg btn-block btn-primary btn-h1-spacing">Create Item</a>
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
						<th>Created At</th>
						<th>Last Modified</th>
						<th></th>
					</thead>
					<tbody>
						<?php 
							$i = 1;    
						?>
						@foreach ($items as $item)
							<tr>
								<th><a href='/items/{{ $item->id }}' class='btn btn-secondary' role='button'>{{ $i++ }}</a></th>
								<td>{{ $item->title }}</td>
								<td style="width: 100px;">{{ date('M j, Y', strtotime($item->created_at)) }}</td>
								<td>{{ date('M j, Y', strtotime($item->updated_at)) }}</td>
								<td style="width: 175px;"><div style='float:left; margin-right:5px;'><a href="{{ route('items.edit', $item->id) }}" class="btn btn-success btn-sm">Edit</a></div>
								<div style='float:left;'>
									{!! Form::open(['route' => ['items.destroy', $item->id], 'method'=>'DELETE']) !!}
										{{ Form::submit('Delete', ['class'=>'btn btn-sm btn-danger btn-block', 'style'=>'', 'onclick'=>'return confirm("Are you sure?")']) }}
									{!! Form::close() !!}
								</div>
								</td>
							</tr>
						@endforeach
					</tbody>
				</table>
				<div class="text-center">
					{!! $items->links(); !!}
				</div>
			</div>
		</div>
	@endguest
@endsection