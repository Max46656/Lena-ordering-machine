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
        Schema::create('items', function (Blueprint $table) {
            $table->id();
            $table->foreignId('res_id')->constrained('restaurants');
            $table->string("name");
            $table->integer('price')->default(0);
            $table->string('cover')->nullable();
            $table->boolean('enabled')->default(true);
            $table->boolean('isBrunch')->default(true);
            $table->boolean('isLunch')->default(true);
            $table->boolean('isDinner')->default(true);
            $table->boolean('isMidnightSnack')->default(true);
            $table->integer('sort')->default(0);
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
        Schema::table('items', function (Blueprint $table) {
            $table->dropForeign(['res_id']);
        });
        Schema::dropIfExists('items');
    }
};