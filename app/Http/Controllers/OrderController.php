<?php


namespace App\Http\Controllers;


use App\Order;
use App\Product;
use Illuminate\Http\Request;


class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    function __construct()
    {
         $this->middleware('permission:order-list|order-create|order-edit|order-delete', ['only' => ['index','show']]);
         $this->middleware('permission:order-create', ['only' => ['create','store']]);
         $this->middleware('permission:order-edit', ['only' => ['edit','update']]);
         $this->middleware('permission:order-delete', ['only' => ['destroy']]);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $orders = Order::latest()->paginate(5);
        return view('orders.index',compact('orders'))
            ->with('i', (request()->input('page', 1) - 1) * 5);
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('orders.create');
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request,[
            'order_id' => 'required',
            'product_id' => 'required',
            'quantity' => 'required',
            'price' => 'required',
            'total_price' => '',
            'user_name' => '',
            'user_mobile' => '',
            'user_email' => '',
            'user_address' => '',
            'discount' => '',
            'status' => 'required',
        ]);
        $input = $request->all();
        Order::create($input);


        return redirect()->route('orders.index')
                        ->with('success','order created successfully.');
    }


    /**
     * Display the specified resource.
     *
     * @param  \App\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function show(order $order)
    {
        return view('orders.show',compact('order'));
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function edit(Order $order)
    {
        return view('orders.edit',compact('order'));
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\order  $order
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Order $order)
    {
        $this->validate($request,[
            'quantity' => 'required',
            'price' => 'required',
            'total_price' => '',
            'user_name' => '',
            'user_mobile' => '',
            'user_email' => '',
            'user_address' => '',
            'status' => 'required',
        ]);
        $input = $request->all();
        $order->update($input);


        return redirect()->route('orders.index')
                        ->with('success','order updated successfully');
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\order  $order
     * @return \Illuminate\Http\Response
     */
    public function destroy(Order $order)
    {
        $order->delete();


        return redirect()->route('orders.index')
                        ->with('success','order deleted successfully');
    }
}
