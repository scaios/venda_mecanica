<?php

namespace App\Http\Controllers;

use App\Models\Categoria;
use Illuminate\Http\Request;

class CategoriaController extends Controller
{
    public function index()
    {
        return Categoria::all();
    }

    public function store(Request $request)
    {
        $request->validate([
            'descricao' => 'required|string|max:255|unique:categoria,descricao',
        ]);

        return Categoria::create($request->all());
    }

    public function show($id)
    {
        return Categoria::findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'descricao' => 'required|string|max:255|unique:categoria,descricao,' . $id,
        ]);

        $categoria = Categoria::findOrFail($id);
        $categoria->update($request->all());

        return $categoria;
    }

    public function destroy($id)
    {
        return Categoria::destroy($id);
    }
}
