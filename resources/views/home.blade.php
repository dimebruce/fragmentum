@extends('layouts.app')

@section('titulo')
    Feed
@endsection

@section('contenido')

    @if ($posts->count())
                
    <div class="flex flex-col gap-6 m-5">
        @foreach ($posts as $p)
            <div class="flex justify-center">
                <div class="max-w-sm rounded overflow-hidden shadow-lg">
                    <a href="{{ route('posts.show', ['post'=>$p, 'user'=>$p->user]) }}">
                        <img class="w-full" src="{{ asset('uploads') . "/" . $p->imagen }}" alt="Imagen del Post {{$p->titulo}}">
                    </a>
                    <div class="px-6 py-4">
                        <p class="font-bold"> {{ $p->user->username }} </p>
                        <div class="font-bold text-xl mb-2">
                            {{$p->titulo}}
                            <p class="text-sm text-gray-500"> {{ $p->created_at->diffForHumans() }} </p>
                        </div>
    
                            <p class="text-gray-700 text-base">
                                {{$p->description}}
                            </p>
                        </div>
                </div>
            </div>
        @endforeach
    </div>

    <div class="ml-5 mr-5 my-10">
        {{ $posts->links('pagination::tailwind') }}
    </div>

    @else
    <p class="text-gray-600 uppercase text-sm text-center font-bold">
        No sigues a nadie aún :(
    </p>
    @endif

@endsection