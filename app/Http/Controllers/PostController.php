<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;

class PostController extends Controller
{
    // Para que Laravel detecte si un usuario esta logueado o no, se usa el middleware de auth
    public function __construct()
    {
        //except es para que el user que no esté autenticado pueda ver parte de los métodos 
        $this->middleware('auth')->except(['show', 'index']);
    }

    public function index(User $user)
    {
        // Se utiliza para ver toda la data que se está mandando por el form.
        // dd(auth()->user());
        // dd($user->username);
        //Antes de la paginación
        // $posts = Post::where('user_id', $user->id)->get();
        //Latest enseña el último post agregado como primero
        $posts = Post::where('user_id', $user->id)->latest()->paginate(8);
        // dd($posts);

        return view('dashboard', [
            'user' => $user,
            'posts' => $posts
        ]);
    }

    public function create()
    {
        // dd('Subiendo foto');
        return view('post.create');
    }

    public function store(Request $request)
    {
        // dd('Creando publicación');
        $this->validate($request, [
            'titulo'=>'required|max:255',
            'description'=>'required',
            'imagen'=>'required'
        ]);

        // Mandando la data a la DB
        // Post::create([
        //     'titulo'=> $request->titulo,
        //     'description'=>$request->description,
        //     'imagen'=>$request->imagen,
        //     'user_id'=>auth()->user()->id
        // ]);

        //Otra forma de mandar data a la DB
        //Se crea una instancia y se mandan los parametros como anteriormente. 
        // $post = new Post;
        // $post -> titulo = $request->titulo;
        // $post -> description = $request->description;
        // $post -> imagen = $request->imagen;
        // $post -> user_id = auth()->user()->id;


        //Tercer forma de guardar data con las relaciones hechas hasMany belogsTo

        // Donde el request, se conecta al user autenticado, después pasa por la relación hasMany creado en el modelo
        $request->user()->posts()->create([
            'titulo'=> $request->titulo,
            'description'=>$request->description,
            'imagen'=>$request->imagen,
            'user_id'=>auth()->user()->id
        ]);



        return redirect()->route('posts.index', auth()->user()->username);
    }

    public function show(User $user, Post $post)
    {
        return view('post.show', [
            'post' => $post,
            'user' => $user
        ]);
    }
    public function destroy(Post $post)
    {
        //Comprueba la policy de Post
        $this->authorize('delete', $post);
        //Si pasa la validación, entonces borra el post
        $post->delete();
        //Borrando la img que está en el server. uploads
        $imagen_path = public_path('uploads/' . $post->imagen);

        if(File::exists($imagen_path)){
            unlink($imagen_path);
        }
        //Redirección al dashboard del user. 
        return redirect()->route('posts.index', auth()->user()->username);
    }
}
