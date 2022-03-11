
@extends('common') 

@section('pagetitle')
Item List
@endsection

@section('pagename')
Laravel Project
@endsection

@section('content')
	<table class="table">
		<td>
			<div class="thumbnail" style="text-align: center">
				<table class="table">
					<thead>
						<th style="text-align: center">Categories</th>
					</thead>
					<tbody>
						<tr>
							<td><div><a href="/products" class="btn btn-sm btn-warning">Reset Sort</a></div></td>
						</tr>
						@foreach ($categories as $category)
							<tr>
								<td><div><a href="/products/{{ $category->id }}" class="btn btn-xs btn-info">{{ $category->category }}</a></div></td>
							</tr>
						@endforeach
					</tbody>
					
				</table>
			</div>
		</td>
			<?php
				$i = 0;
				
			?>
		<td>
			<div class="thumbnail" style="text-align: center">
				<table class="table">
					<thead>
						<th style="text-align: center">Items</th>
					</thead>
					<tbody>
						<tr>
							@foreach ($items as $item)
								@if(isset($catID))
									@if($catID == $item->category_id)
										<td>
											<div class="thumbnail" style="text-align: center">
												<a class="img-thumbnail" href='/items/{{ $item->id }}'><img src={{ URL('storage/images/items/tn_'.$item->picture) }} alt="{{ $item->picture }}"></a>
												<div><a href='/items/{{ $item->id }}'>{{ $item->title }}</a></div>
												<div>${{ $item->price }}</div>
												<div><a href="/items/{{ $item->id }}" class="btn btn-sm btn-primary">Buy Now</a></div>
											</div>
										</td>
									
										<?php
											$i++;
										?>
									@endif
								@else
									<td>
										<div class="thumbnail" style="text-align: center">
											<a class="img-thumbnail" href='/items/{{ $item->id }}'><img src={{ URL('storage/images/items/tn_'.$item->picture) }} alt="{{ $item->picture }}"></a>
											<div><a href='/items/{{ $item->id }}'>{{ $item->title }}</a></div>
											<div>${{ $item->price }}</div>
											<div><a href="/items/{{ $item->id }}" class="btn btn-sm btn-primary">Buy Now</a></div>
										</div>
									</td>
									<?php
										$i++;
									?>
								@endif

								@if($i%4 == 0 && $i > 0)
									</tr>
									<tr>	
								@endif
							@endforeach
						</tr>
					</tbody>
				</table>
			</div>
		</td>
	</table>

	<div class="text-center">
		{!! $items->links(); !!}
	</div>
@endsection