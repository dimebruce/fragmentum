<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFollowersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('followers', function (Blueprint $table) {
            $table->id();
            //Va a guardar el id del usuario que va a seguir
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            //Va a guarda el id del usuario que está siguiendo en la tabla users. 
            //En la parte de arriba, no es necesario de anexar la tabla porque laravel lo detecta por defecto, sin embargo, en la de follower se pierde laravel, porque no tenemos ningun follower id con que relacionar, por eso en el constrained le ponemos la tabla a relacionar->users
            $table->foreignId('follower_id')->constrained('users')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('followers');
    }
}
