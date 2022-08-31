<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class FollowerController extends Controller
{
    public function store(User $user)
    {
        // dd($user->username);

        // Aquí no se puede poner create, porque no se está usando todo el modelo como en likes, por eso es el attach, porque es una relación de tablas. 
        $user->followers()->attach( auth()->user()->id);

        return back();
    }

    public function destroy(User $user)
    {
        // dd($user->username);

        // Aquí no se puede poner create, porque no se está usando todo el modelo como en likes, por eso es el attach, porque es una relación de tablas. 
        $user->followers()->detach( auth()->user()->id);

        return back();
    }
}
