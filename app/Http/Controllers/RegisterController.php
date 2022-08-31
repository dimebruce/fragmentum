<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class RegisterController extends Controller
{
    public function index() 
    {
        return view('auth.register');
    }

    public function store(Request $request)
    {
        // die and down, función en laravel para imprimir pero parar la ejecución del programa. 
        // dd('Post...');
        // Mandar a imprimir lo que hay en request, que son los parametros mandados por el form usando el name. 
        // dd($request);

        //Modificar el request
        $request->request->add(['username' => Str::slug($request->username)]);

        //Validaciones. 
        $this->validate($request, [
            'name' => 'required | max:20',
            'username' => 'required | unique:users| min:3 | max:20',
            'email' => 'required | unique:users| email |  max:60',
            'password' => 'required | confirmed | min:6'
        ]);
        //Validando que pase la data del form a la sig view. 
        // dd('Creando usuario');

        // Agregando data a la DB con un método static
        // Esto es lo equivalente a insert into user
        User::create([
            'name' => $request -> name,
            // Ayuda a que el username no se repita, error de espacios, y acentos. 
            'username' => Str::slug( $request -> username ),
            'email' => $request -> email,
            // El hash es para que la contraseña se encripte en DB
            'password' => Hash::make( $request -> password )
        ]);

        // Autenticar al usuario
        auth()->attempt([
            'email' => $request->email,
            'password' => $request->password
        ]);

        // Otra forma de autenticar y funciona iagual que la de arriba
        // auth()->attempt($request->only('email', 'password'));


        //Redireccionando después de registrar al nuevo usuario. 
        // return redirect()->route('posts.index');
        return redirect()->route('perfil.index');
    }
}
