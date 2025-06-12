<?php

namespace App\Http\Controllers;

use App\Models\MetodoPagamento;
use Illuminate\Http\Request;

class MetodoPagamentoController extends Controller
{
    public function index()
    {
        return MetodoPagamento::all();
    }

    public function store(Request $request)
    {
        return MetodoPagamento::create($request->all());
    }

    public function show($id)
    {
        return MetodoPagamento::findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $metodo = MetodoPagamento::findOrFail($id);
        $metodo->update($request->all());
        return $metodo;
    }

    public function destroy($id)
    {
        return MetodoPagamento::destroy($id);
    }
}
