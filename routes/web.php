<?php
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
        Route::get('/add-resturant', 'SiteController@addResturant');
        Route::get('/add-menu', 'SiteController@addMenu');
        Route::get('/menu/{id}', 'SiteController@Menu');
        Route::get('/get-menu', 'SiteController@getMenu');
        Route::get('/add-cart', 'SiteController@addCart');
        Route::get('/carts', 'SiteController@cartPage');

        // 與其他在SiteController的其他東西
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
Route::get('/menu', function () {
    return view('menu');
});
