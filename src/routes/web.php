<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/test-halaman', function () {
    return 'Test Halaman';
});

Route::get('/test-halaman-1', function () {
    return 'Test Halaman 1';
});
