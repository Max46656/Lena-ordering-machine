<?php

use Carbon\Carbon;
use App\Models\User;
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
Route::get('/mail', function () {
    return view('email.feedback');
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
        Route::post('/wrongMenu', 'SiteController@wrongMenu')->name('wrongMenu');
        Route::post('/alreadyOrder', 'SiteController@alreadyOrder')->name('alreadyOrder');
        Route::get('/searchRestaurant', 'SiteController@searchRestaurant');

    });
    Route::namespace ('App\Http\Controllers')->group(function () {
        Route::get('/evaluate/{id}', 'EvaluateController@evaluate');
        Route::post('/storeEvaluate', 'EvaluateController@storeEvaluate');
        Route::get('/editEvaluate/{res_id}/{user_id}', 'EvaluateController@editEvaluate');
        Route::post('/updateEvaluate/{res_id}/{user_id}', 'EvaluateController@updateEvaluate');

    });
    Route::namespace ('App\Http\Controllers')->group(function () {
        Route::get('/addFavoriteRestaurant', 'FavoriteController@addFavoriteRestaurant');
        Route::get('/deleteFavoriteRestaurant', 'FavoriteController@deleteFavoriteRestaurant');
        Route::get('/favoriteRestaurant', 'FavoriteController@favoriteRestaurant');
    });

});
Route::namespace ('App\Http\Controllers')->group(function () {
    Route::get('/HiAdmin', function () {
        return view('admin');})->name('admin');
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
Route::get('/deleteSession', function (Request $request) {
    $request->session()->flush();
    return redirect(route('index'));
});
Route::get('/review', function () {
    // $reviewArr = [];
    // $reviews = Review::get();
    // foreach ($reviews as $review) {
    //     array_push($reviewArr, $review->res_id . $review->user_id);
    // }

    // return $reviewArr;
    // $items = Restaurant::with('reviews')->get();
    // dd($items);
    // \DB::statement("SET SQL_MODE=''");

    // $views = DB::table('reviews')
    //     ->join('restaurants', 'reviews.res_id', '=', 'restaurants.id')
    //     ->select('restaurants.*', DB::raw('avg(rate)as avg'))->groupBy('reviews.res_id')->get()->toArray();

    // return $views;
    $userId = User::select('id')->where('name', session('name'))->first();
    \DB::statement("SET SQL_MODE=''");

    $items = User::find($userId['id'])->restaurants;
    dd($items[0]->id);

});