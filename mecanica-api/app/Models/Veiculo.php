<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Veiculo extends Model
{
    // Define explicitamente a tabela
    protected $table = 'veiculo';

    protected $fillable = [
        'id_modelo',
        'id_cor',
        'ano',
        'valor',
    ];

    public function modelo()
    {
        return $this->belongsTo(Modelo::class, 'id_modelo');
    }

    public function cor()
    {
        return $this->belongsTo(Cor::class, 'id_cor');
    }
}
