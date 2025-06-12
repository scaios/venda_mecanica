<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Venda extends Model
{
    protected $table = 'venda';

    protected $fillable = [
        'id_cliente',
        'id_vendedor',
        'id_veiculo',
        'id_metodo_pagamento',
        'data_venda'
    ];

    public function cliente()
    {
        return $this->belongsTo(Cliente::class, 'id_cliente');
    }

    public function vendedor()
    {
        return $this->belongsTo(Vendedor::class, 'id_vendedor');
    }

    public function veiculo()
    {
        return $this->belongsTo(Veiculo::class, 'id_veiculo');
    }

    public function metodoPagamento()
    {
        return $this->belongsTo(MetodoPagamento::class, 'id_metodo_pagamento');
    }
}
