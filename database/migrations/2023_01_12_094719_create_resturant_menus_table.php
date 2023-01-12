<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('resturant_menus', function (Blueprint $table) {
            $table->id();
            $table->foreignId('resturant_id')->constrained();
            $table->string('name', 50);
            $table->integer('price')->default(0);
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
        Schema::table('resturant_menus', function (Blueprint $table) {
            $table->dropForeign(['resturant_id']);
        });

        Schema::dropIfExists('resturant_menus');
    }
};