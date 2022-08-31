<?php

namespace App\Models;

use App\Models\Comentario;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Post extends Model
{
    use HasFactory;

    // El fillable es lo que proteje la DB, lo cual le dices a Laravel, los datos que serán ingresados
    protected $fillable = [
        'titulo',
        'description',
        'imagen',
        'user_id'
    ];

    

    // Creando la relación de tablas, de Post con User
    // Es decir, Post puede tener 1 User
    public function user()
    {
        //Diciendo que post puede tener 1 user
        // Con el select, le dices a laravel que solo te traiga la info name y username de la relación user con post
        return $this->belongsTo(User::class)->select(['name', 'username']);
    }

    public function comentarios()
    {
        //La relacion donde un Post tendrá N comentarios
        return $this->hasMany(Comentario::class);
    }

    //Se crea la relación, porque post tendrá muchos likes

    public function likes()
    {
        // Se define la relación de uno a muchos con el Modelo Like
        return $this->hasMany(Like::class);
    }

    public function checkLike(User $user)
    {
        // Hace la relación dónde si la tabla likes contiene user_id significa que ya dió like
        return $this->likes->contains('user_id', $user->id);
    }
}
