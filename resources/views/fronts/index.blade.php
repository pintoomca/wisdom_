@extends('layouts.app')


@section('content')


<div class="row">
        <div class="col">
            <div class="row">
            @foreach ($products as $product)
            @php
            $product->product_image = (!empty($product->product_image))?"/wisdom/storage/app/public/".$product->product_image:"https://dummyimage.com/600x400/55595c/fff";
            @endphp
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="card">
                        <img class="card-img-top" src="{{$product->product_image}}" width="347" height="231" alt="Card image cap">
                        <div class="card-body">
                            <h4 class="card-title"><a href="#" title="View Product">{{ $product->name }}</a></h4>
                            <p class="card-text">{{ $product->detail  }}</p>
                            <div class="row">
                                <div class="col">
                                    <p class="btn btn-danger btn-block">{{ $product->price  }} $</p>
                                </div>
                                <div class="col">
                                    <a href="{{url('buy',$product->id)}}" class="btn btn-success btn-block">Buy Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                @endforeach
                <div class="col-12">
                    <nav aria-label="...">
                    {!! $products->links() !!}
                    </nav>
                </div>
            </div>
        </div>

    </div>




@endsection
