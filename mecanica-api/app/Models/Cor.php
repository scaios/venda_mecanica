<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Cor extends Model
{
    protected $table = 'cor';

    protected $fillable = ['descricao'];

    public function veiculos()
    {
        return $this->hasMany(Veiculo::class, 'id_cor');
    }
}
