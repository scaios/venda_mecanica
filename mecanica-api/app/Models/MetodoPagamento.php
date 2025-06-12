<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MetodoPagamento extends Model
{
    protected $table = 'metodo_pagamento';

    protected $fillable = ['descricao'];

    public function vendas()
    {
        return $this->hasMany(Venda::class, 'id_metodo_pagamento');
    }
}
