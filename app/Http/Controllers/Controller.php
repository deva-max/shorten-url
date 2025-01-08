<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;

    public function email_invite()
    {
        $user = auth()->user();

        if($user->role !== 'admin'){
            \Log::info('not admin');
            return back()->with('error', 'You ar not authorized to send invites');
        }

        return view('invite');    

    }
}
