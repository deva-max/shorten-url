<?php

namespace App\Http\Controllers;

use App\Mail\InviteUserMail;
use App\Models\AccessToken;
use App\Models\ShortUrl;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class DashboardController extends Controller
{
    public function index()
    {
        $user = auth()->user();

        if ($user->isAdmin()) {
            $members = User::where('role', 'member')->get(); // Fetch all members
            $shortUrls = ShortUrl::where('created_by', $user->id)->get();
        } else {
            $members = [];
            $shortUrls = ShortUrl::where('created_by', $user->id)->get();
        }

        return view('dashboard.index', compact('members', 'shortUrls'));
    }

    // public function invite(Request $request)
    // {
    //     $request->validate([
    //         'email' => 'required|email|unique:users,email|unique:invites,email',
    //         'name' => 'required|string|max:255', // Ensure name is validated
    //     ]);

    //     $user = auth()->user();
    //     if (!$user->isAdmin()) {
    //         return back()->with('error', 'You are not authorized to invite users.');
    //     }

    //     // Send invite email
    //     $inviteToken = bin2hex(random_bytes(16));
    //     $inviteLink = route('signup', ['token' => $inviteToken]);

    //     // Store invite token in user metadata (or create an Invite model)
    //     $user->invites()->create([
    //         'email' => $request->email,
    //         'token' => $inviteToken,
    //         'name' => $request->name,
    //     ]);

        


    //     Mail::to($request->email)->send(new InviteUserMail($inviteLink));

    //     return back()->with('success', 'Invitation sent successfully.');
    // }

    public function createShortUrl(Request $request)
    {
        $request->validate([
            'long_url' => 'required|url',
        ]);

        $shortUrl = ShortUrl::create([
            'long_url' => $request->long_url,
            'short_code' => substr(md5($request->long_url. now()), 0, 6),
            'create_by' => auth()->id(),
        ]);

        return response()->json(['short_url' => $shortUrl->short_code], 201);
    }

    public function generateToken()
    {
        $user = auth()->user();
        if(!$user->isAdmin()){
            return response()->json(['error' => 'You are not authorized to generate tokens.'], 403);
        }

        \Log::info($user->isAdmin());

        $token = AccessToken::create([
            'user_id' => $user->id,
            'token' => bin2hex(random_bytes(32)),
            'permissions' => json_encode(['generate_url', 'delete_url']),
            'client_id' => $user->id, // Assuming client_id is linked to the user
        ]);

        return response()->json(['token' => $token->token]);

    }
}
