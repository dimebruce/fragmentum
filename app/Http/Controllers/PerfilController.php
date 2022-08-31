<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;

class PerfilController extends Controller
{
    // Es para decirle a laravel que no todos podrán entrar a esta ruta si es que no están autenticados
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function index()
    {
        // dd('Editando perfil');
        return view('perfil.index');
    }

    public function store(Request $request)
    {
        //Modificar el request y valida si no existe ya el username en la DB
        $request->request->add(['username' => Str::slug($request->username)]);
        // dd('Guardando cambios');
        $this->validate($request, [
            //Cuando son más de 3 reglas Laravel recomienda que las pongas en un arreglo
            // 'username' => 'required | unique:users| min:3 | max:20'
            'username' => ['required','unique:users,username,'.auth()->user()->id, 'min:3', 'max:20', 'not_in:admin,root,superroot,superuser'],
        ]);

        // Si la imagen existe, se guardará
        if ($request -> imagen) {
            // return "Desde imagen controlerr";

            // Ver todos los request
            $imagen = $request->file('imagen');

            //Asignado nombre a la variable
            //uuid es para generar un id unico dentro de la DB
            $nombreImagen = Str::uuid() . "." . $imagen->extension();

            // Utilizando image de intervation
            $imagenServer = Image::make($imagen);
            // Crando la instancia de image, para el resize
            $imagenServer -> fit(1000,1000);
            // Indicando la ruta donde se guardará la img
            $imagenPath = public_path('perfiles') . "/" . $nombreImagen;
            //Guardando la img
            $imagenServer->save($imagenPath);

            // return response()->json(['imagen' => $nombreImagen]);
        }

        //Guadando los cambios
        // Buscar el user por id
        $usuario = User::find(auth()->user()->id);
        $usuario->username = $request->username;
        // Añadiendo la imagen o si no la sube, será vació
        $usuario->imagen   = $nombreImagen ?? auth()->user()->imagen ?? null;
        $usuario->save();


        // Redirección
        return redirect()->route('posts.index', $usuario->username);

    }


}
