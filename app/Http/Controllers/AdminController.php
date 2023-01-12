<?php

namespace App\Http\Controllers;

class AdminController extends Controller
{
    public function addRestaurant()
    {
        return redirect('/admin/restaurants/create');

    }
    public function addMenu()
    {
        return redirect('/admin/items/create');

    }
}