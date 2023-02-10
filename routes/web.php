<?php
use Carbon\Carbon;
use App\Models\User;
use App\Models\OnDuty;
use Illuminate\Http\Request;
use TCG\Voyager\Facades\Voyager;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
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
        Route::get('/index', 'SiteController@index')->name('index');
        Route::get('/menu/{id}', 'SiteController@getMenu')->name('getMenu');
        Route::get('/getOrder', 'SiteController@getOrder');
        Route::post('/wrongMenu', 'SiteController@wrongMenu')->name('wrongMenu');
        Route::get('/alreadyOrder', 'SiteController@alreadyOrder')->name('alreadyOrder');
        Route::get('/searchRestaurant', 'SiteController@searchRestaurant');

    });
    Route::namespace ('App\Http\Controllers')->group(function () {
        Route::get('/evaluate/{id}', 'EvaluateController@evaluate');
        Route::post('/storeEvaluate', 'EvaluateController@storeEvaluate');
        Route::get('/editEvaluate/{res_id}/{user_id}', 'EvaluateController@editEvaluate');
        Route::post('/updateEvaluate/{res_id}/{user_id}', 'EvaluateController@updateEvaluate');

    });
    Route::namespace ('App\Http\Controllers')->group(function () {
        Route::get('/addFavoriteRestaurant', 'FavoriteController@addFavoriteRestaurant')->name('addFavorite');
        Route::get('/deleteFavoriteRestaurant', 'FavoriteController@deleteFavoriteRestaurant');
        Route::get('/favoriteRestaurant', 'FavoriteController@favoriteRestaurant');
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

Route::namespace ('App\Http\Controllers')->group(function () {
    Route::get('/HiAdmin', function () {
        return view('admin');})->name('admin');
    Route::get('/add-restaurant', 'AdminController@addRestaurant')->name('addRes');
    Route::get('/add-menu', 'AdminController@addMenu')->name('addMenu');
});
Route::get('/session', function (Request $request) {
    return $request->session()->all();
});
Route::get('/deleteSession', function (Request $request) {
    $request->session()->flush();
    return redirect(route('index'));
});
// Route::get('/mailTest', function () {
//     return view('email.testMail');
// });
Route::get('/', function () {
    if (Auth::user()) {
        return redirect(route('index'));
    }
    return redirect(route("register"));
});
Route::get('test', function () {

});