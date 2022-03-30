<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::prefix('v1')->group(function(){
    Route::prefix('user')->group(function(){
        Route::post('register', "UserController@register");
        Route::post('login', "UserController@login")->name('api.authenticate');;
    });
    Route::middleware('jwt.auth')->group(function () {
        Route::prefix('user')->group(function(){
            Route::get('logout',"UserController@logout");
            // get authenticated user
            Route::get('get',"UserController@get");
            Route::patch('update/{id}','UserController@update');
            Route::delete('delete','UserController@delete');
        });

        Route::prefix('wallet')->group(function(){
            Route::post('fundWallet', "WalletController@fundWallet");
            Route::post('transferFund', "WalletController@transferFund");
            Route::patch('withdrawFund', "WalletController@withdrawFund");
        });
    });

});



