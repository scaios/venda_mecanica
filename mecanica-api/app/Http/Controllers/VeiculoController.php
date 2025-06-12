<?php

namespace App\Http\Controllers;

use App\Models\Veiculo;
use Illuminate\Http\Request;

class VeiculoController extends Controller
{
    public function index()
    {
        return Veiculo::with(['modelo', 'cor'])->get();
    }

    public function store(Request $request)
    {
        $veiculo = Veiculo::create($request->only(['id_modelo', 'id_cor', 'ano', 'valor']));
        return response()->json($veiculo->load(['modelo', 'cor']), 201);
    }

    public function show($id)
    {
        return Veiculo::with(['modelo', 'cor'])->findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $veiculo = Veiculo::findOrFail($id);
        $veiculo->update($request->only(['id_modelo', 'id_cor', 'ano', 'valor']));
        return response()->json($veiculo->load(['modelo', 'cor']));
    }

    public function destroy($id)
    {
        return response()->json(['deleted' => Veiculo::destroy($id)]);
    }
}
