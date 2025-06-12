<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ClienteController;
use App\Http\Controllers\CorController;
use App\Http\Controllers\CategoriaController;
use App\Http\Controllers\ModeloController;
use App\Http\Controllers\VeiculoController;
use App\Http\Controllers\VendedorController;
use App\Http\Controllers\MetodoPagamentoController;
use App\Http\Controllers\VendaController;

Route::apiResource('vendas', VendaController::class);

Route::apiResource('metodos-pagamento', MetodoPagamentoController::class);

Route::apiResource('vendedores', VendedorController::class);

Route::apiResource('veiculos', VeiculoController::class);

Route::apiResource('modelos', ModeloController::class);

Route::apiResource('categorias', CategoriaController::class);

Route::apiResource('cores', CorController::class);

Route::apiResource('clientes', ClienteController::class);
