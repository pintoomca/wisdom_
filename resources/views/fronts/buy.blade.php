@extends('layouts.app')
@section('content')
    <div class="row">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h2> Order Detail</h2>
            </div>
            <div class="pull-right">
                <a class="btn btn-primary" href="{{ route('products.index') }}"> Back</a>
            </div>
        </div>
    </div>


    <div class="row">
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
        <div class="col-12 col-md-6 col-lg-6">
            <div class="card">
                <img class="card-img-top" src="{{$product->product_image}}" width="347" height="231" alt="Card image cap">
                <div class="card-body">
                    <h4 class="card-title"><a href="#" title="View Product">{{ $product->name }}</a></h4>
                    <p class="card-text">{{ $product->detail  }}</p>
                    <p class="btn btn-success btn-block">{{ $product->price  }} $</p>
                </div>
            </div>
        </div>

    <div class="col-12 col-md-6 col-lg-6">
    <form method="POST" action="{{url('order-place')}}" accept-charset="UTF-8">
    	@csrf


         <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12">
		        <div class="form-group">
		            <strong>Quantity:</strong>
                    <input type="hidden" name="product_id"  value="{{$product->id}}">
		            <input type="number" id="qty" name="quantity" class="form-control" placeholder="Quantity" value="1">
		        </div>
		    </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
		        <div class="form-group">
		            <strong>Price:</strong>
		            <input type="text" name="price" class="form-control" placeholder="Price" value="{{$product->price}}" readonly>
		        </div>
		    </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
		        <div class="form-group">
		            <strong>Total Price:</strong>
		            <input type="text" id="total_price" name="total_price" class="form-control" placeholder="Total Price" value="{{$product->price}}" readonly>
		        </div>
		    </div>
    <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="form-group">
            <strong>Name:</strong>
            {!! Form::text('user_name', null, array('placeholder' => 'Name','class' => 'form-control')) !!}
        </div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="form-group">
            <strong>Mobile:</strong>
            {!! Form::text('user_mobile', null, array('placeholder' => 'Mobile','class' => 'form-control')) !!}
        </div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="form-group">
            <strong>Email:</strong>
            {!! Form::text('user_email', null, array('placeholder' => 'Email','class' => 'form-control')) !!}
        </div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="form-group">
            <strong>Address:</strong>
            {!! Form::text('user_address', null, array('placeholder' => 'Address','class' => 'form-control')) !!}
        </div>
    </div>
		    <div class="col-xs-12 col-sm-12 col-md-12 text-center">
		            <button type="submit" class="btn btn-primary">Place Order</button>
		    </div>
		</div>


    </form>
    </div>
    </div>
<script type="text/javascript">
    $(document).ready(function() {
        var price='{{$product->price}}';
        $("#qty").on('blur',function(){
          $('#total_price').val(($('#qty').val()*price).toFixed(2));
        });
    });
</script>
@endsection
