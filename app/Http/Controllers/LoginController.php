<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class LoginController extends Controller
{
    public function index()
    {
        return view('auth.login');
    }

    public function store(Request $request)
    {
        // dd('Autenticando ...');

        // Validando las credenciales y mandar error si no son llenadas
        $this->validate($request, [
            'email'=>'required|email',
            'password'=>'required'
        ]);


        // Validando los datos de entrada con los de la DB
        //Se agrega request remember para la función del checkbox de recordar el token en caché, cookies.
        if(!auth()->attempt($request->only('email','password'), $request->remember)){
            // con el back, retornamos al user a login, el ultimo blade. 
            // with manda el mensaje al blade por medio del controller.
            return back()->with('mensaje','Los datos ingresados no coinciden.');
        }

        // Si el login se realiza con exito, lo que hace es redireccionar a la página de post
        return redirect()->route('posts.index', auth()->user()->username);
    }
}
