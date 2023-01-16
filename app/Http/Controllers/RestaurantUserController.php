<?php

namespace App\Http\Controllers;

use App\Models\RestaurantUser;
use App\Http\Requests\StoreRestaurantUserRequest;
use App\Http\Requests\UpdateRestaurantUserRequest;

class RestaurantUserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreRestaurantUserRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreRestaurantUserRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\RestaurantUser  $restaurantUser
     * @return \Illuminate\Http\Response
     */
    public function show(RestaurantUser $restaurantUser)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\RestaurantUser  $restaurantUser
     * @return \Illuminate\Http\Response
     */
    public function edit(RestaurantUser $restaurantUser)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateRestaurantUserRequest  $request
     * @param  \App\Models\RestaurantUser  $restaurantUser
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateRestaurantUserRequest $request, RestaurantUser $restaurantUser)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\RestaurantUser  $restaurantUser
     * @return \Illuminate\Http\Response
     */
    public function destroy(RestaurantUser $restaurantUser)
    {
        //
    }
}
