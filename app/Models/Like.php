<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Like extends Model
{
    use HasFactory;

    //fillable se define porque son los párametros que va a llenar la DB, se usa como método de seguridad. 
    protected $fillable = [
        'user_id'
    ];
}
