<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    @stack('styles')
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <script src="{{ asset('js/app.js')  }}" defer></script>
    <title>Fragmentum - @yield('titulo')</title>
</head>
<body class="bg-gray-100" >
    <header class="p-5 border-b bg-white shadow">
        <div class="container mx-auto flex justify-between items-center">
            <a href="{{ route('home') }}" class="text-3xl font-black"> 
                Fragmentum
            </a>
            {{-- Si el user esta autenticado sale esto --}}
            @auth
                <nav class="flex gap-2 items-center">

                    <a class="flex items-center gap-2 bg-white border p-2 text-gray-600 rounded text-sm uppercase font-bold cursor-pointer" href="{{ route('posts.create') }}">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M3 9a2 2 0 012-2h.93a2 2 0 001.664-.89l.812-1.22A2 2 0 0110.07 4h3.86a2 2 0 011.664.89l.812 1.22A2 2 0 0018.07 7H19a2 2 0 012 2v9a2 2 0 01-2 2H5a2 2 0 01-2-2V9z" />
                            <path stroke-linecap="round" stroke-linejoin="round" d="M15 13a3 3 0 11-6 0 3 3 0 016 0z" />
                        </svg>
                    </a>
                    <a class="font-bold text-gray-600 text-sm" href="{{ route('posts.index', auth()->user()->username) }}">
                        <span>
                            {{ auth()->user()->username }}
                        </span>
                    </a>
                    <form method="POST" action="{{ route('logout') }}" >
                        @csrf
                        <button type="submit" class="flex font-bold uppercase text-red-600 text-sm items-center">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0013.5 3h-6a2.25 2.25 0 00-2.25 2.25v13.5A2.25 2.25 0 007.5 21h6a2.25 2.25 0 002.25-2.25V15M12 9l-3 3m0 0l3 3m-3-3h12.75" />
                            </svg>                              
                        </button>
                    </form>
                </nav>
            @endauth
            {{-- Si el user no está autenticado sale esto --}}
            @guest
                <nav class="flex gap-2 items-center">
                    <a class="font-bold uppercase text-gray-600 text-sm" href="{{ route('login') 
                    }}">Login</a>
                    <a class="font-bold uppercase text-gray-600 text-sm" href="{{ route('register') }}">Sign up</a>
                </nav>
            @endguest
        </div>
    </header>

    <main class="container mx-auto mt-10">
        <h1 class="font-black text-center text-3xl mb-10">@yield('titulo')</h1>
        @yield('contenido')
    </main>

    <footer class="text-center mt-10 p-5 text-gray-500 font-bold align-items-center">
        <span> Fragmentum - Built with ♥
           by <a href="https://bit.ly/_dimebruce
            " target="_blank"> dimebruce</a> 
        </span>   -
        {{-- //Helper para imprimir fecha usando php en el blade. --}}
        {{ now() -> year}}
    </footer>
</body>
</html>