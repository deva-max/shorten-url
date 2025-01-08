<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ShortUrl extends Model
{
    protected $fillable = [
        'long_url',
        'short_url',
        'client_id',
        'user_id',
        'created_by'
    ];
}
