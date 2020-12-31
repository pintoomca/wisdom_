<?php


namespace App;


use Illuminate\Database\Eloquent\Model;


class Order extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'order_id', 'product_id', 'total_price', 'discount', 'user_name', 'user_mobile', 'user_email', 'user_address', 'quantity', 'price', 'status'
    ];
}
