<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class JenisPengeluaranController extends Controller
{
    public function index()
    {
        $user = Auth::user();
        $data = DB::table('jenis_pengeluaran')->where('user_id', $user->id)->get();

        return response()->json([
            'status' => true,
            'message' => 'List Jenis Pengeluaran',
            'data' => $data
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'nama_pengeluaran' => 'required|string|max:100',
            'keterangan' => 'nullable|string',
        ]);
        $user = Auth::user();
        $id = DB::table('jenis_pengeluaran')->insertGetId([
            'nama_pengeluaran' => $request->nama_pengeluaran,
            'keterangan' => $request->keterangan,
            'user_id' => $user->id,
        ]);

        return response()->json([
            'status' => true,
            'message' => 'Data berhasil disimpan',
            'id' => $id
        ]);
    }

    public function show(Request $request)
    {
        $user = Auth::user();
        $data = DB::table('jenis_pengeluaran')->where('user_id', $user->id)->find($request->id);

        if (!$data) {
            return response()->json(['status' => false, 'message' => 'Data tidak ditemukan'], 404);
        }

        return response()->json(['status' => true, 'data' => $data]);
    }

    public function update(Request $request)
    {
        $request->validate([
            'nama_pengeluaran' => 'required|string|max:100',
            'keterangan' => 'nullable|string',
        ]);
        $user = Auth::user();
        DB::table('jenis_pengeluaran')
            ->where('id', $request->id)
            ->where('user_id', $user->id)
            ->update([
                'nama_pengeluaran' => $request->nama_pengeluaran,
                'keterangan' => $request->keterangan,
            ]);

        return response()->json(['status' => true, 'message' => 'Data berhasil diperbarui']);
    }

    public function destroy(Request $request)
    {
        DB::table('jenis_pengeluaran')->where('id', $request->id)->delete();

        return response()->json(['status' => true, 'message' => 'Data berhasil dihapus']);
    }
}
