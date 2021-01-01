<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes();

    Route::group(['middleware' => ['auth']], function() {
    Route::resource('roles','RoleController');
    Route::resource('users','UserController');
   Route::resource('products','ProductController');
   Route::resource('orders','OrderController');
});
//Product List
Route::get('/','FrontController@index');
Route::get('buy/{id}','FrontController@buy');
Route::post('order-place','FrontController@orderStore');
Route::get('thankyou/{id}','FrontController@thankyou');
