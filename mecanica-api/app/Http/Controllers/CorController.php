<?php

namespace App\Http\Controllers;

use App\Models\Cor;
use Illuminate\Http\Request;

class CorController extends Controller
{
    public function index()
    {
        return Cor::all();
    }

    public function store(Request $request)
    {
        return Cor::create($request->all());
    }

    public function show($id)
    {
        return Cor::findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $cor = Cor::findOrFail($id);
        $cor->update($request->all());
        return $cor;
    }

    public function destroy($id)
    {
        return Cor::destroy($id);
    }
}
