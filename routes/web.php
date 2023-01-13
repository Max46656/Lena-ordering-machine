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
        Route::get('/menu/{id}', 'SiteController@getMenu')->name('getMenu');
        Route::get('/getOrder', 'SiteController@getOrder');
        Route::get('/carts', 'SiteController@cartPage');

    });
    Route::namespace ('App\Http\Controllers')->group(function () {
        Route::get('/add-restaurant', 'AdminController@addRestaurant')->name('addRes');
        Route::get('/add-menu', 'AdminController@addMenu')->name('addMenu');

    });
    Route::namespace ('App\Http\Controllers')->group(function () {
        Route::get('/cart', 'CartController@cartPage');
        Route::post('/addCart', 'SiteController@addCart')->name('addCart');
        // Route::get('/addCart/{item}', 'CartController@addCart')->name('addCart');
        Route::get('/updateCart/{item}', 'CartController@updateCart')->name('updateCart');
        Route::get('/clearAllCart', 'CartController@clearAllCart')->name('clearCart');
        Route::get('/removeCart/{item}', 'CartController@removeCart')->name('removeCart');
    });

});
Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});