<?php

namespace App\Http\Controllers;

use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;

class ImagenController extends Controller
{
    public function store(Request $request)
    {
        // return "Desde imagen controlerr";

        // Ver todos los request
        $imagen = $request->file('file');

        //Asignado nombre a la variable
        //uuid es para generar un id unico dentro de la DB
        $nombreImagen = Str::uuid() . "." . $imagen->extension();

        // Utilizando image de intervation
        $imagenServer = Image::make($imagen);
        // Crando la instancia de image, para el resize
        $imagenServer -> fit(1000,1000);
        // Indicando la ruta donde se guardará la img
        $imagenPath = public_path('uploads') . "/" . $nombreImagen;
        //Guardando la img
        $imagenServer->save($imagenPath);

        return response()->json(['imagen' => $nombreImagen]);

    }
}
