<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class JenisPenerimaanController extends Controller
{
    public function index()
    {
        $user = Auth::user();
        $data = DB::table('jenis_penerimaan')->where('user_id', $user->id)->get();

        return response()->json([
            'status' => true,
            'message' => 'List Jenis Penerimaan',
            'data' => $data
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'nama_penerimaan' => 'required|string|max:100',
            'keterangan' => 'nullable|string',
        ]);
        $user = Auth::user();
        $id = DB::table('jenis_penerimaan')->insertGetId([
            'nama_penerimaan' => $request->nama_penerimaan,
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
        $data = DB::table('jenis_penerimaan')->find($request->id);

        if (!$data) {
            return response()->json(['status' => false, 'message' => 'Data tidak ditemukan'], 404);
        }

        return response()->json(['status' => true, 'data' => $data]);
    }

    public function update(Request $request)
    {
        $request->validate([
            'nama_penerimaan' => 'required|string|max:100',
            'keterangan' => 'nullable|string',
        ]);

        DB::table('jenis_penerimaan')
            ->where('id', $request->id)
            ->update([
                'nama_penerimaan' => $request->nama_penerimaan,
                'keterangan' => $request->keterangan,
            ]);

        return response()->json(['status' => true, 'message' => 'Data berhasil diperbarui']);
    }

    public function destroy(Request $request)
    {
        DB::table('jenis_penerimaan')->where('id', $request->id)->delete();

        return response()->json(['status' => true, 'message' => 'Data berhasil dihapus']);
    }
}
