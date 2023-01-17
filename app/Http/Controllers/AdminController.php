<?php

namespace App\Http\Controllers;

class AdminController extends Controller
{
    public function isAdmin($role_id)
    {
        $admin = 1;
        $user = 2;
        if ($role_id != $admin) {
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
