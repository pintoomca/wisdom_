@extends('layouts.app')


@section('content')
    <div class="row">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h2>Add New Product</h2>
            </div>
            <div class="pull-right">
                <a class="btn btn-primary" href="{{ route('orders.index') }}"> Back</a>
            </div>
        </div>
    </div>


    @if ($errors->any())
        <div class="alert alert-danger">
            <strong>Whoops!</strong> There were some problems with your input.<br><br>
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif
    {!! Form::open(array('route' => 'orders.store','method'=>'POST')) !!}
    	@csrf


         <div class="row">
             <div class="col-xs-12 col-sm-12 col-md-12">
		        <div class="form-group">
		            <strong>Order ID:</strong>
		            <input type="text" name="name" class="form-control" placeholder="Name" value="{{(DB::table('orders')->max('id'))+1}}">
		        </div>
		    </div>
		    <div class="col-xs-12 col-sm-12 col-md-12">
		        <div class="form-group">
                    @php
                    $products = DB::table('products')->pluck('name', 'id');
                    @endphp
		            <strong>Product:</strong>
                    {!! Form::select('product_id', $products, null, ['class' => 'form-control','placeholder' => 'Product']) !!}
		        </div>
		    </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
		        <div class="form-group">
		            <strong>Quantity:</strong>
		            <input type="number" name="quantity" class="form-control" placeholder="Quantity">
		        </div>
		    </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
		        <div class="form-group">
		            <strong>Price:</strong>
		            <input type="text" name="price" class="form-control" placeholder="Price">
		        </div>
		    </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
		        <div class="form-group">
		            <strong>Total Price:</strong>
		            <input type="text" name="total_price" class="form-control" placeholder="Total Price">
		        </div>
		    </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>Order Status:</strong>
                    {!! Form::select('status', ['New' => 'New', 'Processing' => 'Processing','Delivered' => 'Delivered','Returned' => 'Returned'], null, ['class' => 'form-control']) !!}
                </div>
            </div>
		    <div class="col-xs-12 col-sm-12 col-md-12 text-center">
		            <button type="submit" class="btn btn-primary">Submit</button>
		    </div>
		</div>


    </form>


<p class="text-center text-primary"><small> </small></p>
@endsection
