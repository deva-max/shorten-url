<?php

namespace App\Http\Controllers;

use App\Models\ShortUrl;
use GuzzleHttp\Client;
use Illuminate\Http\Request;

class ShortUrlController extends Controller
{
    public function generate(Request $request) {
        $request->validate(['long_url' => 'required|url']);

        $shortUrl = ShortUrl::create([
            'long_url' => $request->long_url,
            'short_url' => \Str::random(6),
            'client_id' => auth()->user()->client_id,
            'user_id' => auth()->id(),
            'created_by' => auth()->user()->id,
        ]);

        \Log::info($shortUrl);

        return response()->json(['short_url' => $shortUrl->short_url]);
    }
}
