<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */

    //  fillable lo que hace es donde se definen los datos que se esperan que entren y eso lo hace una medida de seguridad para que nadie inserte datos de más.
    protected $fillable = [
        'name',
        'email',
        'password',
        'username',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    // Creando la relación de tablas, de user con Posts
    // Es decir, un user puede tener n posts 
    public function posts()
    {
        //Diciendo que user puede tener n Posts
        return $this->hasMany(Post::class);
    }


    // Relacion de likes donde cada user, puede tener varios likes.
    public function likes()
    {
        return $this->hasMany((Like::class));
    }

    //Relacioón de followers, donde un usuario pertenece a followers || seguidores. 
    public function followers()
    {
        return $this->belongsToMany(User::class, 'followers', 'user_id', 'follower_id');
    }

    //Relacioón de following, donde los followers pertenecen a un user || seguidores. 
    public function following()
    {
        return $this->belongsToMany(User::class, 'followers', 'follower_id', 'user_id');
    }
    //Comprobar si un user ya sigue a otro
    public function siguiendo(User $user)
    {
        return $this->followers->contains($user->id);
    }
        
    
}
