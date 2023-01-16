<?php

use Carbon\Carbon;
use App\Models\Review;
use App\Models\Restaurant;
use Illuminate\Http\Request;
use TCG\Voyager\Facades\Voyager;
use Illuminate\Support\Facades\DB;
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
        Route::get('/alreadyOrder', 'SiteController@alreadyOrder')->name('alreadyOrder');
        Route::get('/searchRestaurant', 'SiteController@searchRestaurant');

    });
    Route::namespace ('App\Http\Controllers')->group(function () {
        Route::get('/evaluate/{id}', 'EvaluateController@evaluate');
        Route::post('/storeEvaluate', 'EvaluateController@storeEvaluate');
        Route::get('/editEvaluate/{res_id}/{user_id}', 'EvaluateController@editEvaluate');
        Route::post('/updateEvaluate/{res_id}/{user_id}', 'EvaluateController@updateEvaluate');
        Route::get('/addFavoriteRestaurant', 'EvaluateController@addFavoriteRestaurant');
        Route::get('/deleteFavoriteRestaurant', 'EvaluateController@deleteFavoriteRestaurant');
    });
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

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
Route::get('/session', function (Request $request) {
    return $request->session()->all();
});
Route::get('/review', function () {
    // $reviewArr = [];
    // $reviews = Review::get();
    // foreach ($reviews as $review) {
    //     # code...
    //     array_push($reviewArr, $review->res_id . $review->user_id);
    // }

    // return $reviewArr;
    // $items = Restaurant::with('reviews')->get();
    // dd($items);
    \DB::statement("SET SQL_MODE=''");

    $views = DB::table('reviews')
        ->join('restaurants', 'reviews.res_id', '=', 'restaurants.id')
        ->select('restaurants.*', DB::raw('avg(rate)as avg'))->groupBy('reviews.res_id')->get()->toArray();

    return $views;

});