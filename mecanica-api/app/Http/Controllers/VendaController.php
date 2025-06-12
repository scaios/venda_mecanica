<?php

namespace App\Http\Controllers;

use App\Models\Venda;
use Illuminate\Http\Request;

class VendaController extends Controller
{
    public function index()
    {
        return Venda::with(['cliente', 'vendedor', 'veiculo', 'metodoPagamento'])->get();
    }

    public function store(Request $request)
    {
        $venda = Venda::create($request->only([
            'id_cliente',
            'id_vendedor',
            'id_veiculo',
            'id_metodo_pagamento',
            'data_venda'
        ]));
        return response()->json($venda->load(['cliente', 'vendedor', 'veiculo', 'metodoPagamento']), 201);
    }

    public function show($id)
    {
        return Venda::with(['cliente', 'vendedor', 'veiculo', 'metodoPagamento'])->findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $venda = Venda::findOrFail($id);
        $venda->update($request->only([
            'id_cliente',
            'id_vendedor',
            'id_veiculo',
            'id_metodo_pagamento',
            'data_venda'
        ]));
        return response()->json($venda->load(['cliente', 'vendedor', 'veiculo', 'metodoPagamento']));
    }

    public function destroy($id)
    {
        return response()->json(['deleted' => Venda::destroy($id)]);
    }
}
