@extends('layouts.app')


@section('content')
    <div class="row">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h2>Orders</h2>
            </div>
            <div class="pull-right">
                @can('order-create')
                <!-- <a class="btn btn-success" href="{{ route('orders.create') }}"> Create New Order</a> -->
                @endcan
            </div>
        </div>
    </div>


    @if ($message = Session::get('success'))
        <div class="alert alert-success">
            <p>{{ $message }}</p>
        </div>
    @endif


    <table class="table table-bordered">
        <tr>
            <th>No</th>
            <th>Product</th>
            <th>Order ID</th>
            <th width="280px">Action</th>
        </tr>
	    @foreach ($orders as $order)
	    <tr>
	        <td>{{ ++$i }}</td>
	        <td>{{ $order->product_id }}</td>
	        <td>{{ $order->order_id }}</td>
	        <td>
                <form action="{{ route('orders.destroy',$order->id) }}" method="POST">
                    <a class="btn btn-info" href="{{ route('orders.show',$order->id) }}">Show</a>
                    @can('order-edit')
                    <a class="btn btn-primary" href="{{ route('orders.edit',$order->id) }}">Edit</a>
                    @endcan


                    @csrf
                    @method('DELETE')
                    @can('order-delete')
                    <button type="submit" class="btn btn-danger">Delete</button>
                    @endcan
                </form>
	        </td>
	    </tr>
	    @endforeach
    </table>


    {!! $orders->links() !!}


<p class="text-center text-primary"><small> </small></p>
@endsection
