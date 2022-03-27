@extends('common') 

@section('pagetitle')
Create Item
@endsection

@section('pagename')
Laravel Project
@endsection

@section('scripts')
{!! Html::script('/bower_components/parsleyjs/dist/parsley.min.js') !!}
@endsection

@section('css')
{!! Html::style('/css/parsley.css') !!}
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
		{!! Form::open(['route' => 'items.store', 'data-parsley-validate' => '', 
			                'files' => true]) !!}
			<div class="col-md-6 col-md-offset-2">

				<h1>Create Item</h1>
				<hr/>
	
				{{ Form::label('title', 'Name:') }}
					{{ Form::text('title', null, ['class'=>'form-control', 'style'=>'', 
												  'data-parsley-required'=>'', 
												  'data-parsley-maxlength'=>'255']) }}
	
					{{ Form::label('category_id', 'Category:', ['style'=>'margin-top:20px']) }}
					<select name='category_id' class='form-control' data-parsley-required="true">
						<option value="">Select Category</option>
						@foreach ($categories as $category)
							<option value='{{ $category->id }}'>{{ $category->category }}</option>
						@endforeach
					</select>

					{{ Form::label('description', 'Description:', ['style'=>'margin-top:20px']) }}
					{{ Form::textarea('description', null, ['class'=>'description', 
													'data-parsley-required'=>'']) }}
					<script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
					<script>
						tinymce.init({
							selector:'textarea.description',
							height: 300
						});
					</script>
					
					{{ Form::label('price', 'Price:', ['style'=>'margin-top:20px']) }}
					{{ Form::text('price', null, ['class'=>'form-control', 'style'=>'', 
												  'data-parsley-required'=>'']) }}
	
					{{ Form::label('quantity', 'Quantity:', ['style'=>'margin-top:20px']) }}
					{{ Form::text('quantity', null, ['class'=>'form-control', 'style'=>'', 
												  'data-parsley-required'=>'']) }}
												  
					{{ Form::label('sku', 'SKU:', ['style'=>'margin-top:20px']) }}
					{{ Form::text('sku', null, ['class'=>'form-control', 'style'=>'', 
												  'data-parsley-required'=>'']) }}
	
					{{ Form::label('picture', 'Picture:', ['style'=>'margin-top:20px']) }}
					{{ Form::file('picture', null, ['class'=>'form-control', 
														   'style'=>'',
														   'data-parsley-required'=>'']) }}
			
			</div>
			<div class="col-md-4">
				<div class="well" style="margin-top: 20px">
					<dl class="dl-horizontal">
						<dt>Created At:</dt>
						<dd>{{ date('M j, Y h:ia', time()) }}</dd>
					</dl>
					<hr />
					<div class="row">
						<div class="col-sm-6">
							{!! Html::linkRoute('items.index', 'Cancel', NULL, ['class'=>'btn btn-danger btn-block']) !!}
						</div>
						<div class="col-sm-6">
							{{ Form::submit('Save', ['class'=>'btn btn-success btn-block', 'style'=>'margin-top:0px']) }}
						</div>
					</div>
				</div>		
			</div>
			{!! Form::close() !!}
		</div>
	@endguest
@endsection