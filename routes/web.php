<?php
use Carbon\Carbon;
use Illuminate\Http\Request;
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
// Route::get('/send', function () {
//     return view('feedback');
// });
Route::get('/', function () {
    return view('welcome');
});
Route::get('/Duty', function () {
    $allPerson = ['bgirl0123456789@gmail.com' => 0, 'maxfromsea36@gmail.com' => 1];
    $PersonOnDuty = array_rand($allPerson);

    return dd($PersonOnDuty);
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
        Route::get('/wrongMenu', 'SiteController@wrongMenu');
        Route::get('/oreadyOrder', 'SiteController@oreadyOrder')->name('oreadyOrder');

    });
    Route::namespace ('App\Http\Controllers')->group(function () {
        Route::get('/add-restaurant', 'AdminController@addRestaurant')->name('addRes');
        Route::get('/add-menu', 'AdminController@addMenu')->name('addMenu');
    });
    Route::namespace ('App\Http\Controllers')->group(function () {
        Route::get('/cart', 'CartController@cartPage')->name('CartPage');
        Route::post('/addCart', 'CartController@addCart')->name('addCart');
        Route::post('/updateCart', 'CartController@updateCart')->name('updateCart');
        Route::get('/clearAllCart', 'CartController@clearAllCart')->name('clearCart');
        Route::get('/removeCart/{item}', 'CartController@removeCart')->name('removeCart');
        Route::get('/storeCart', 'CartController@storeCart')->name('storeCart');
        Route::get('/totalCart', 'CartController@totalCart')->name('totalCart');

    });
});
Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
Route::get('/session', function (Request $request) {
    return $request->session()->all();
});
Route::get('/carbon', function () {
    return date('y-m-d');
});