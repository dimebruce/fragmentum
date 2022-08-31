<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class LogoutController extends Controller
{
    public function store()
    {
        // Probando la conexión de blades
        // dd('Cerrando sesión');

        // Cerrando la sesión
        auth()->logout();

        //Redireccionando a la pantalla de login cuando se cierre sesión
        return redirect()->route('login');

    }
}
