<?php
use TCG\Voyager\Facades\Voyager;
use Illuminate\Support\Facades\Route;

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
Route::get('/', function () {
    return view('welcome');
});
Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {
    Route::get('/dashboard', function () {
        return view('dashboard');
    })->name('dashboard');
    Route::namespace ('App\Http\Controllers')->group(function () {
        Route::get('/', 'SiteController@index')->name('index');
        Route::get('/menu/{item}', 'SiteController@getMenu')->name("getMenu");
        Route::get('/get-menu', 'SiteController@getOrder');
        Route::get('/add-cart', 'SiteController@addCart')->name('addCart');
        Route::get('/carts', 'SiteController@cartPage');

        // 與其他在SiteController的其他東西
    });
    Route::namespace ('App\Http\Controllers')->group(function () {
        Route::get('/add-restaurant', 'AdminController@addRestaurant')->name('addRes');
        Route::get('/add-menu', 'AdminController@addMenu')->name('addMenu');

    });
    Route::namespace ('App\Http\Controllers')->group(function () {
        Route::get('/cart', 'CartController@cartPage');
        Route::get('/addCart/{item}', 'CartController@addCart')->name('addCart');
        Route::get('/updateCart/{item}', 'CartController@updateCart')->name('updateCart');
        Route::get('/clearAllCart', 'CartController@clearAllCart')->name('clearCart');
        Route::get('/removeCart/{item}', 'CartController@removeCart')->name('removeCart');
        // 與其他在CartController的其他東西
    });

});
Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});