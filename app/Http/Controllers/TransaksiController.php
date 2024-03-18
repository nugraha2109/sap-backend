<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
use App\Models\Transaksi;

class TransaksiController extends Controller
{
    public function index()
    {
        // $data = DB::table('marketinggs')
        // ->join('penjualanns', 'penjualanns.marketing_id', '=', 'marketinggs.id')
        // ->get();
        $tran = Transaksi::all();
        return response()->json($tran, 200);
    }

    public function show($id)
    {
        $tran = Transaksi::find($id);

        if (!$tran) {
            return response()->json(['message' => 'Transaksi not found'], 404);
        }

        return response()->json($tran, 200);
    }

    public function store(Request $request)
    {
        $request->validate([
            'transaksi_id' => 'required|exists:produk,id',
            'produk_id' => 'required|exists:customer,id',
            'jumlah' => 'required|integer',
            'nama' => 'required|string',
            'transaksi_kode' => 'required|string',
        ]);

        $tran = Transaksi::create($request->all());

        return response()->json($tran, 201);
        
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
