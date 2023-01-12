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
        // 與其他在SiteController的其他東西
    });
    Route::namespace ('App\Http\Controllers')->group(function () {
        Route::get('/cart', 'CartController@cartPage');
        Route::get('/addCart/{item}', 'CartController@addCart')->name('addCart');
        Route::get('/updateCart/{item}', 'CartController@updateCart')->name('updateCart');
        Route::get('/clearAllCart', 'CartController@clearAllCart')->name('clearCart');
        Route::get('/removeCart/{item}', 'CartController@removeCart')->name('removeCart');
        Route::namespace ('App\Http\Controllers\Api\MailController')->group(function () {
    Route::get('/feedback', function () {
    return view('feedback');
});
        

    });
    Route::namespace ('App\Http\Controllers\Api\MailController')->group(function () {
        Route::get('/feedback', function () {
        return view('feedback');
    });

});
Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
});
});
