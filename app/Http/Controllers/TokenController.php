<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class TokenController extends Controller
{
    public function gerrateToken(Request $request){
        $user = $request->user();

        if(!$user->isAdmin()){
            return response()->json(['error' => 'Unauthorized'], 403);
        }

        $token = $user->createToken('short-url-service', ['generate', 'delete']);

        return response()->json([
            'token' => $token->plainTextToken,
            'message' => 'Token generated successfully',
        ]);
    }
}
