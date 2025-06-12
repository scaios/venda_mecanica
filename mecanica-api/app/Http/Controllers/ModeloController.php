<?php

namespace App\Http\Controllers;

use App\Models\Modelo;
use Illuminate\Http\Request;

class ModeloController extends Controller
{
    public function index()
    {
        return Modelo::with('categoria')->get();
    }

    public function store(Request $request)
    {
        return Modelo::create($request->all());
    }

    public function show($id)
    {
        return Modelo::with('categoria')->findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $modelo = Modelo::findOrFail($id);
        $modelo->update($request->all());
        return $modelo;
    }

    public function destroy($id)
    {
        return Modelo::destroy($id);
    }
}
