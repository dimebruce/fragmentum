@extends('layouts.app')

@section('titulo')
    Perfíl de: {{ $user->username}}
@endsection

@section('contenido')
    <div class="flex justify-center">
        <div class="w-full md:w-8/12 lg:w-6/12 flex flex-col items-center md:flex-row">
            <div class="md:w-8/12 lg:w-6/12 px-5">
                <img class="rounded-lg" src="{{ $user->imagen ? asset('perfiles') . '/' . $user->imagen : asset('img/user.png') }}" alt="Imagen avatar del usuario">
            </div>
            <div class="md:w-8/12 lg:w-6/12 px-5 flex flex-col items-center md:justify-center md:items-start py-10 md:py-10">
                
                <div class="flex items-center gap-2">
                        <p class="text-gray-700 text-2xl tracking-wide underline decoration-sky-500"> {{ $user->username }} </p>
                        @auth
                        
                        {{-- El usuario necesita estar autenticado para poder realizar cambios en su perfil --}}
                        
                        @if ($user->id === auth()->user()->id)
                        
                        <a class="text-gray-500 hover:text-gray-700 cursor-pointer" href=" {{ route('perfil.index') }} ">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0115.75 21H5.25A2.25 2.25 0 013 18.75V8.25A2.25 2.25 0 015.25 6H10" />
                            </svg>
                            
                        </a>
                        
                        @endif
                        
                        @endauth
                </div>
                <p class="text-gray-800 text-sm mb-3 font-bold mt-5">
                    {{$user->followers->count()}}
                    {{-- El choice es para el prural de seguidores --}}
                    <span class="font-normal"> @choice('Seguidor|Seguidores', $user->followers->count()) </span>
                </p>
                <p class="text-gray-800 text-sm mb-3 font-bold">
                    {{$user->following->count()}}
                    <span class="font-normal"> Siguiendo</span>         
                </p>
                <p class="text-gray-800 text-sm mb-3 font-bold">
                    {{$user->posts->count()}}
                    <span class="font-normal"> Post</span>
                </p>

                @auth
                    {{-- Si el user visitado id es diferente al usuario logueado, puede serguirlo --}}
                    @if ($user->id !== auth()->user()->id)
                        {{-- Aquí se niega, por si no es seguidor, le aparezca el btn seguir --}}
                        @if (!$user->siguiendo(auth()->user()))
                            <form action=" {{ route('users.follow', $user) }} " method="POST">
                                @csrf
                                <input 
                                type="submit"
                                class="bg-blue-600 text-white uppercase rounded-lg px-3 py-1 text-xs font-bold cursor-pointer"
                                value="seguir"
                                >
                            </form>
                        @else
                            <form method="POST" action=" {{ route('users.unfollow', $user) }} " >
                                @csrf
                                @method('DELETE')
                                <input 
                                type="submit"
                                class="bg-red-600 text-white uppercase rounded-lg px-3 py-1 text-xs font-bold cursor-pointer"
                                value="dejar de seguir"
                                >
                            </form>
                        @endif
                    @endif
                @endauth
            </div>
        </div>
    </div>

    <section class="container mx-auto mt-10">
        <h2 class="text-4xl text-center font-black my-10">
            Publicaciones
        </h2>

        @if ($posts->count())
            
            <div class="grid md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6 m-5 mr-5">
                @foreach ($posts as $p)
                    <div>
                        <a href="{{ route('posts.show', ['post'=>$p, 'user'=>$user]) }}">
                            <img  class="shadow-xl rounded-xl" src="{{ asset('uploads') . "/" . $p->imagen }}" alt="Imagen del Post {{$p->titulo}}">
                        </a>
                    </div>
                @endforeach
            </div>

            <div class="ml-5 mr-5 my-10">
                {{ $posts->links('pagination::tailwind') }}
            </div>
            
        @else
            <p class="text-gray-600 uppercase text-sm text-center font-bold">
                No hay públicaciónes aún :(
            </p>
        @endif

    </section>

@endsection