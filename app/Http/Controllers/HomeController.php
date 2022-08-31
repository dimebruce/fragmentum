<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\User;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    //Para que solo vean el home aquellos que sólo esten autenticados. 

    public function __construct()
    {
        $this->middleware('auth');
    }
    // Invoke funciona como el constructor, donde aparece o devuelve esta vista por defecto
    public function __invoke()
    {
        // dd('Estamos en home');
        //Obtener data de quienes seguimos
        $ids = auth()->user()->following->pluck('id')->toArray(); 
        // Pagination es la paginación, lates, es para que publique el orden de los post. El último agregado se verá primero.
        $posts = Post::whereIn('user_id', $ids)->latest()->paginate(8); 
        return view('home',  [
            'posts' => $posts
        ]);
    }
}
