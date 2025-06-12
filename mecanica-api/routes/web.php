<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\DB;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/teste-db', function () {
    try {
        $veiculo = DB::table('veiculo')->first(); // nome correto da tabela
        return response()->json($veiculo);
    } catch (\Exception $e) {
        return response()->json(['erro' => $e->getMessage()], 500);
    }
});
