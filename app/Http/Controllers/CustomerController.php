<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
use App\Models\Customers;

class CustomerController extends Controller
{
    public function index()
    {
        $pembayarans = Customers::all();
        return response()->json($pembayarans, 200);
    }

    public function show($id)
    {
        $pembayaran = Customers::find($id);

        if (!$pembayaran) {
            return response()->json(['message' => 'Data not found'], 404);
        }

        return response()->json($pembayaran, 200);
    }

    public function store(Request $request)
    {
        $request->validate([
            'kode_customers' => 'required', 'string', 'max:255',
            'nama' => 'required','string','max:255',
            'addres' => 'required','string','max:255',
            'telp' => 'required','integer',
        ]);

        $pembayaran = Customers::create($request->all());

        return response()->json($pembayaran, 201);
        
    }

    public function update(Request $request, $id)
    {
        $pembayaran = Customers::find($id);

        if (!$pembayaran) {
            return response()->json(['message' => 'Data not found'], 404);
        }

        $request->validate([
            'kode_customers' => 'required',
            'nama' => 'required',
            'addres' => 'required',
            'telp' => 'required',
        ]);

        $pembayaran->update($request->all());

        return response()->json($pembayaran, 200);
    }

    public function destroy($id)
    {
        $pembayaran = Customers::find($id);

        if (!$pembayaran) {
            return response()->json(['message' => 'Data not found'], 404);
        }

        $pembayaran->delete();

        return response()
        ->json([
            'status'=> 'success',
            'message' => 'Data deleted successfully'], 200);
    }
}
