<?php

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Controller;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\InviteController;
use App\Http\Controllers\ShortUrlController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::middleware('auth')->group(function () {
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
    Route::post('/invite', [InviteController::class, 'invite'])->name('invite');
    Route::post('/short-url/generate', [ShortUrlController::class, 'generate'])->name('short-url.generate');
    Route::get('/short-url', function () {
        return view('short-url');
    })->name('short-url');

    Route::get('email/invite', [Controller::class, 'email_invite'])->name('email.invite');
});

Route::get('/login/{user}', [LoginController::class, 'inviteLogin'])
    ->name('login.invite')
    ->middleware('signed'); 

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
