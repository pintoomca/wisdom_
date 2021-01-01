<?php


namespace App\Http\Controllers;


use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Product;
use App\Order;
use DB;
use Hash;


class FrontController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $products = Product::where('status',1)->orderBy('id','DESC')->paginate(4);
        return view('fronts.index',compact('products'))
            ->with('i', ($request->input('page', 1) - 1) * 5);
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function buy($id)
    {
        $product = Product::find($id);
        return view('fronts.buy',compact('product'));
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function orderStore(Request $request)
    {
        $this->validate($request,[
            'order_id' => '',
            'product_id' => 'required',
            'quantity' => 'required',
            'price' => 'required',
            'total_price' => 'required',
            'user_name' => 'required',
            'user_mobile' => 'required',
            'user_email' => 'required',
            'user_address' => 'required',
            'discount' => '',
            'status' => '',
        ]);



        $input = $request->all();
        $str = date("YmdHis").(DB::table('orders')->max('id'))+1;
        $input['order_id'] =  str_pad($str,22,"X",STR_PAD_LEFT);
        $input['status'] =  "New";
        $order = Order::create($input);
        if ($order->exists) {
            return redirect("thankyou/".$input['order_id']);
         } else {
            // failure
         }

    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function thankyou($id)
    {

        echo "Thank you your order placed successfully<br>";
        echo "Order ID: $id";
        die;
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $user = User::find($id);
        $roles = Role::pluck('name','name')->all();
        $userRole = $user->roles->pluck('name','name')->all();


        return view('users.edit',compact('user','roles','userRole'));
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        // $this->validate($request, [
        //     'name' => 'required',
        //     'email' => 'required|email|unique:users,email,'.$id,
        //     'password' => 'same:confirm-password',
        //     'roles' => 'required'
        // ]);
        $this->validate($request, [
            'name' => 'required',
            'email' => 'required|email|unique:users,email,'.$id,
            'password' => 'same:confirm-password',
            'roles' => 'required',
            'mobile' => 'required',
            'country' => 'required',
            'state' => 'required',
            'district' => 'required',
            'login_ip' => '',
            'status' => 'required',
            'profile_image' => '',
        ]);

        $input = $request->all();
        if($request->hasFile('profile_image'))
        {
            $input['profile_image'] = $request->file('profile_image')->store('user','public');
        }
        if(!empty($input['password'])){
            $input['password'] = Hash::make($input['password']);
        }else{
            $input = array_except($input,array('password'));
        }


        $user = User::find($id);
        $user->update($input);
        DB::table('model_has_roles')->where('model_id',$id)->delete();


        $user->assignRole($request->input('roles'));


        return redirect()->route('users.index')
                        ->with('success','User updated successfully');
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        User::find($id)->delete();
        return redirect()->route('users.index')
                        ->with('success','User deleted successfully');
    }
}
