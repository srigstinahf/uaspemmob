@extends('layouts.app')

@section('content')
<div class="bg-cover bg-center h-screen" style="background-image: url('{{ asset('images/ramai perpustakaan.jpg') }}');">
    <div class="bg-black bg-opacity-50 h-full flex flex-col justify-center items-center text-white text-center">
        <h1 class="text-6xl font-bold">ABOUT OUR COMPANY</h1>
    </div>
</div>

<div class="container mx-auto px-6 py-12">
    <div class="bg-amber-100 p-6 rounded-lg shadow-lg">
        <h2 class="text-4xl font-bold">SECRET GARDEN</h2>
        <p class="text-lg mt-4">
            Secret Garden hadir untuk mempermudah Anda dalam mengakses dunia pengetahuan melalui aplikasi e-Library berbayar. Dirancang bagi mereka yang tidak memiliki waktu untuk ke perpustkaan, aplikasi ini memberikan akses 24/7 ke ribuan buku digital dan materi edukasi, kapan saja dan di mana saja.
        </p>
        <p class="text-lg mt-4">
            Hemat waktu dan biaya, nikmati pengalaman membaca yang praktis dan menyenangkan. Bergabunglah dengan Secret Garden dan temukan kemudahan belajar di genggaman tangan Anda!
        </p>
    </div>
</div>
@endsection
