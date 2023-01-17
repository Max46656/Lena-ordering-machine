<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;

class AdminController extends Controller
{
    public function isAdmin()
    {
        $admin = 1;
        if (Auth::user()->role_id != $admin) {
            return false;
        }
        return true;
    }
    public function addRestaurant()
    {
        return redirect('/admin/restaurants/create');

    }
    public function addMenu()
    {
        return redirect('/admin/items/create');

    }
}