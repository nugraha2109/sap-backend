<?php

namespace App\Http\Controllers;

use App\Models\Pembayaran;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;

class Pembayarancontroller extends Controller
{
    public function index()
    {
        // $data = DB::table('marketinggs')
        // ->join('penjualanns', 'penjualanns.marketing_id', '=', 'marketinggs.id')
        // ->get();
        $pembayarans = Pembayaran::all();
        return response()->json($pembayarans, 200);
    }

    public function show($id)
    {
        $pembayaran = Pembayaran::find($id);

        if (!$pembayaran) {
            return response()->json(['message' => 'Pembayaran not found'], 404);
        }

        return response()->json($pembayaran, 200);
    }

    public function store(Request $request)
    {
        $request->validate([
            'penjualan_id' => 'required|exists:penjualanns,id',
            'marketing_id' => 'required|exists:marketinggs,id',
            'jumlah' => 'required|numeric',
            'tanggal_jatuh_tempo' => 'required|date',
            'status' => 'required|in:Belum Lunas,Lunas',
        ]);

        $pembayaran = Pembayaran::create($request->all());

        return response()->json($pembayaran, 201);
        
    }

    public function update(Request $request, $id)
    {
        $pembayaran = Pembayaran::find($id);

        if (!$pembayaran) {
            return response()->json(['message' => 'Pembayaran not found'], 404);
        }

        $request->validate([
            'penjualan_id' => 'required|exists:penjualanns,id',
            'marketing_id' => 'required|exists:marketinggs,id',
            'jumlah' => 'required|numeric',
            'tanggal_jatuh_tempo' => 'required|date',
            'status' => 'required|in:Belum Lunas,Lunas',
        ]);

        $pembayaran->update($request->all());

        return response()->json($pembayaran, 200);
    }

    public function destroy($id)
    {
        $pembayaran = Pembayaran::find($id);

        if (!$pembayaran) {
            return response()->json(['message' => 'Pembayaran not found'], 404);
        }

        $pembayaran->delete();

        return response()
        ->json([
            'status'=> 'success',
            'message' => 'Pembayaran deleted successfully'], 200);
    }
}
