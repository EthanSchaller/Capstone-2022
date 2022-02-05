@extends('common') 

@section('pagetitle')
Item List
@endsection

@section('pagename')
Laravel Project
@endsection

@section('content')
@if(Auth::user())
	<section class="container">
		<div class="row">
			<div class="col-md-6">
				<ul class="nav navbar-nav navbar-left">
					<div class="thumbnail" style="text-align: center">
						<table class="table">
							<thead>
								<th style="text-align: center">Categories</th>
							</thead>
							<tbody>
								@foreach ($categories as $category)
									<tr>
										<td><input type="checkbox" name="checkbox" value="value"> {{ $category->category }}</td>
									</tr>
									@endforeach
							</tbody>
						</table>
					</div>
				</ul>
			</div>
			<?php
				$i = 1;
			?>
			<div class="col-sm-5 col-md-5 col-lg-5">
				<section class="container ">
					<ul class="nav navbar-nav navbar-left">
						<div class="row">
							@foreach ($items as $item)
								<div class="col-sm-2 col-md-2" >
									<div class="thumbnail" style="text-align: center" >
										<tr><a class="img-thumbnail" href='/items/{{ $item->id }}'><img src={{ URL('storage/images/items/'.$item->picture) }} alt="{{ $item->picture }}" width="100" height="133"></a></tr>
										<tr>
											<div><a href='/items/{{ $item->id }}'>{{ $item->title }}</a></div>
											<div>${{ $item->price }}</div>
											<div><a href="/items/{{ $item->id }}" class="btn btn-sm btn-primary">View Item</a></div>
										</tr>
									</div>
								</div>
							<?php
								$i++;
							?>
							@if($i%5 == 0)
								</div>
								<div class="row">
									
							@endif
							@endforeach
						</div>
					</ul>
				</section>
			</div>
		</div>	
	</section>

	<div class="text-center">
		{!! $items->links(); !!}
	</div>

@else
	<p>You are currently logged out. Please login to access the website</p>
	<a href='/login' class='btn btn-default' role='button'>Login</a>
@endif
@endsection