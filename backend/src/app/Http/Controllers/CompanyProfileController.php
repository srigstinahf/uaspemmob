<?php

namespace App\Http\Controllers;

class CompanyProfileController extends Controller
{
    public function index()
    {
        return view('index');
    }
    
    public function about()
    {
        return view('about');
    }
    
    public function products()
    {
        return view('products');
    }
}

