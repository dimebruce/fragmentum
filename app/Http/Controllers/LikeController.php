<?php

namespace App\Http\Controllers;

use App\Models\Post;
use Illuminate\Http\Request;

class LikeController extends Controller
{
    public function store(Request $request, Post $post)
    {
        $post->likes()->create([
            'user_id' => $request->user()-> id
        ]);
        //Regresa a la vista mostrando el cambio // El like
        return back();
    }

    public function destroy(Request $request, Post $post)
    {
        // dd('Eliminando like');

        // Lo que hace es que lo que trae request, entra al user, likes, y si existe -where un post id lo borra
        //En otras palabras, si el user ya dio like, lo puede borrar. Esto depende de otro modelo User con la relación ya establecida. 
        $request->user()->likes()->where('post_id', $post->id)->delete();

        return back();
    }
}
