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
        Schema::create('vendas', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('cliente_id');
            $table->unsignedBigInteger('vendedor_id');
            $table->unsignedBigInteger('veiculo_id');
            $table->unsignedBigInteger('metodo_pagamento_id');
            $table->date('data_venda');
            $table->timestamps();
    
            $table->foreign('cliente_id')->references('id')->on('clientes')->onDelete('cascade');
            $table->foreign('vendedor_id')->references('id')->on('vendedors')->onDelete('cascade');
            $table->foreign('veiculo_id')->references('id')->on('veiculos')->onDelete('cascade');
            $table->foreign('metodo_pagamento_id')->references('id')->on('metodo_pagamentos')->onDelete('cascade');
        });
    }
    

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('vendas');
    }
};
