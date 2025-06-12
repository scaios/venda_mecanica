<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Modelo extends Model
{
    protected $table = 'modelo';

    protected $fillable = ['descricao', 'id_categoria'];

    public function categoria()
    {
        return $this->belongsTo(Categoria::class, 'id_categoria');
    }
}
