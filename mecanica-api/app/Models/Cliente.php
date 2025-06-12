<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Cliente extends Model
{
    protected $table = 'cliente';

    protected $fillable = [
        'nome',
        'cpf',
        'telefone',
        'email'
    ];

    public function vendas()
    {
        return $this->hasMany(Venda::class, 'id_cliente');
    }
}
