<?php

namespace App\Http\Controllers;

use App\Models\Comentario;
use App\Models\Post;
use Illuminate\Http\Request;
use App\Models\User;

class ComentarioController extends Controller
{
    public function store(Request $request, User $user, Post $post)
    {
        //Probando la conexión
        // dd('Comentando');

        //Validar
        
        $this->validate($request, [
            'comentario'=>'required|max:255'
        ]);

        //Almacenar la data en DB

        Comentario::create([
            'user_id'=>auth()->user()->id,
            'post_id'=>$post->id,
            'comentario'=> $request->comentario
        ]);

        //Pintar mensage de confirmación de agregado correctamenta a la DB

        return back()->with('mensaje', 'Comentario enviado correctamente');
    }
}
