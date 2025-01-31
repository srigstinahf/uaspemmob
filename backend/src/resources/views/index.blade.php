@extends('layouts.app')

@section('content')
<div class="bg-cover bg-center h-screen" style="background-image: url('{{ asset('images/perpustakaan.jpg') }}');">
    <div class="bg-black bg-opacity-50 h-full flex flex-col justify-center items-center text-white text-center">
        <h1 class="text-6xl font-bold">SECRET GARDEN</h1>
        <nav class="mt-6">
            <a href="{{ route('home') }}" class="mx-4 text-lg font-semibold">HOME</a>
            <a href="{{ route('about') }}" class="mx-4 text-lg font-semibold">ABOUT</a>
        </nav>
    </div>
</div>

<div class="container mx-auto px-6 py-12">
    <div class="bg-amber-100 p-6 rounded-lg shadow-lg">
        <h2 class="text-4xl font-bold">STRONG BRAIN, STRONG INSIGHT</h2>
        <p class="text-lg mt-4">Membaca adalah kunci untuk melatih otak dan memperluas wawasan. Dengan membaca, kita mengasah kemampuan berpikir kritis, meningkatkan daya ingat, dan memperkaya pemahaman. Kebiasaan ini membangun otak yang kuat dan wawasan yang tajam, membantu kita menghadapi dunia dengan lebih bijak dan percaya diri. Jadikan membaca sebagai gaya hidup untuk masa depan yang lebih cerdas!</p>
    </div>
</div>

<div class="bg-amber-200 py-12">
    <div class="container mx-auto px-6 text-center">
        <h2 class="text-3xl font-bold">THIS IS YOUR STEP</h2>
        <div class="text-lg mt-4">
            <p>Ada banyak buku yang tersedia dalam satu aplikasi!</p>
            <p>Ayo berlangganan sekarang, temukan ribuan buku pengetahuan yang dapat kamu eksplorasi!</p>
            <p>Contact us:</p>
            <p>+62876543210</p>
        </div>
    </div>
</div>

@endsection
