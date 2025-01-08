<?php

namespace App\Http\Controllers;

use App\Mail\InviteUserMail;
use App\Models\Clients;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\URL;

class InviteController extends Controller
{
    public function invite(Request $request)
{
    \Log::info('invite controller');
    // Validate the email input
    $request->validate(['email' => 'required|email']);

    // Create or find the client
    $client = Clients::firstOrCreate(['name' => $request->name]);

    // Create the user with a random password (hashed)
    $user = User::create([
        'name' => $request->name,
        'email' => $request->email,
        'password' => Hash::make(\Str::random(12)), // Use a random password
        'client_id' => $client->id,
        'role' => 'admin', // or other roles you need
    ]);

    // Generate the signed URL for login
    $loginUrl = URL::temporarySignedRoute(
        'login.invite', // Route name (to be created in routes)
        now()->addMinutes(60), // URL valid for 1 hour
        ['user' => $user->id] // Pass user ID or any identifier you want to include
    );

    // Send the invitation email with the login link
    Mail::to($request->email)->send(new InviteUserMail($user, $loginUrl));
}   
}
