<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SECRET GARDEN</title>
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    <header class="bg-black text-white p-4 text-center text-xl font-bold">
        SECRET GARDEN
    </header>
    
    <main>
        @yield('content')
    </main>

    <footer class="bg-gray-800 text-white text-center p-4 mt-8">
        &copy; {{ date('Y') }} SECRET GARDEN. All rights reserved.
    </footer>
</body>
</html>
