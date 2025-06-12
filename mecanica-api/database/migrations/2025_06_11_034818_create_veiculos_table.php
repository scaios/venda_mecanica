<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::create('veiculos', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('modelo_id');
            $table->unsignedBigInteger('cor_id');
            $table->integer('ano');
            $table->decimal('valor', 10, 2);
            $table->timestamps();
    
            $table->foreign('modelo_id')->references('id')->on('modelos')->onDelete('cascade');
            $table->foreign('cor_id')->references('id')->on('cors')->onDelete('cascade');
        });
    }
    

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('veiculos');
    }
};
