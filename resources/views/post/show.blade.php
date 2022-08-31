@extends('layouts.app')

@section('titulo')
    {{$post->titulo}}
@endsection

@section('contenido')
    <div class="container mx-auto md:flex">
        <div class="md:w-1/2 p-5">
            <img src="{{ asset('uploads') . "/" . $post->imagen }}" alt="Imagen del post {{ $post->titulo}}">

            <div class="p-3 flex items-center gap-4">
                {{-- Para que no le aparezca el corazón a user no invitados --}}
                @auth

                    @if ($post -> checkLike(auth()->user()) )
                        <form method="POST" action=" {{ route('posts.likes.destroy', $post) }} ">
                            {{-- Spoffing para que soporte el metho delete --}}
                            @method('DELETE')
                            @csrf
                            <div class="my-4">
                                <button type="submit">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="#0284c7" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z" />
                                    </svg>
                                </button>
                            </div>
                        </form>
                    @else
                        <form method="POST" action=" {{ route('posts.likes.store', $post) }} ">
                            @csrf
                            <div class="my-4">
                                <button type="submit">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z" />
                                    </svg>
                                </button>
                            </div>
                        </form>
                    @endif
                @endauth
                <p class="font-bold">{{ $post->likes->count() }} 
                    <span class="font-normal"> Likes</span>
                </p>
            </div>
            <div>
                <p class="font-bold"> {{ $post->user->username }} </p>
                {{-- diffForHumans es una libreria que tiene laravel para el formateo de la fecha --}}
                <p class="text-sm text-gray-500"> {{ $post->created_at->diffForHumans() }} </p>
                <p class="mt-5 font-bold"> {{$post->titulo}} </p>
                <p class=""> {{$post->description}} </p>
            </div>
            

            {{-- btn delete --}}
            @auth
                {{-- Si la persona que está autenticada creó la publicación, que le aparezca este code.  --}}
                @if ($post->user_id === auth()->user()->id)
                    <form method="POST" action=" {{ route('posts.destroy', $post) }} ">
                        {{-- Esto se le llama spoofing --}}
                        @method('DELETE')
                        @csrf
                        <input 
                        type="submit"
                        value="Eliminar publicación"
                        class="bg-red-500 hover:bg-red-600 p-2 rounded text-white font-bold mt-4 cursor-pointer"    
                        >
                    </form>                
                @endif
            @endauth
        </div>

        <div class="md:w-1/2 p-5">
            <div class="shadow bg-white p-5 mb-5">
                <p class="text-xl font-bold text-center mb-4"> Comentarios</p>

                @auth

                @if (session('mensaje'))
                    <div class="bg-green-500 p-2 rounded mb-6 text-white text-center uppercase font-bold">
                        {{session('mensaje')}}
                    </div>
                @endif

                    <form action=" {{ route('comentarios.store', ['user'=>$user, 'post'=>$post]) }}" method="POST">

                        @csrf
                        
                        <div class="mb-5">
                            <label for="comentario" class="mb-2 block uppercase text-gray-500 font-bold">
                                Comentario
                            </label>
                            <textarea 
                                id="comentario"
                                name="comentario"
                                placeholder="Agrega un comentario"
                                class="border p-3 w-full rounded-lg @error('comentario')
                                    border-red-500
                                @enderror"></textarea>
                            @error('comentario')
                                <p class="bg-red-500 text-white my-2 rounded-lg text-sm p-2 text-center">{{$message}}</p>
                            @enderror
                        </div>
                        <input 
                            type="submit"
                            value="Comentar"
                            class="bg-sky-600 hover:bg-sky-700 transition-colors cursor-pointer uppercase font-bold w-full p-3 text-white rounded-lg"
                        >
                    </form>
                @endauth
                <div class="bg-white shadow mb-5 max-h-96 overflow-y-scroll mt-10">
                    @if ($post->comentarios->count())
                        @foreach ($post->comentarios as $c)
                            <div class="p-5 border-gray-300 border-b">
                                <a href="{{ route('posts.index', $c->user) }}" class="font-bold">
                                    {{ $c->user->username }}
                                </a>
                                <p> {{ $c->comentario }} </p>
                                <p class="text-sm text-gray-500">  {{ $c->created_at->diffForHumans() }} </p>
                            </div>
                        @endforeach
                    @else
                        {{-- Esto está en vemos de usarlo o ono --}}
                        <p class="text-gray-600 uppercase text-sm text-center font-bold">
                            No hay comentarios aún :(
                        </p>
                    @endif
            </div>
            </div>
        </div>
    </div>
@endsection