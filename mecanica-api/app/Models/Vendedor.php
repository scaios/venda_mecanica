<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Vendedor extends Model
{
    protected $table = 'vendedor';

    protected $fillable = [
        'nome',
        'cpf',
        'telefone',
        'email',
        'percentual_comissao'
    ];

    public function vendas()
    {
        return $this->hasMany(Venda::class, 'id_vendedor');
    }
    
}
